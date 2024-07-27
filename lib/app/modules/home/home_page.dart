import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher_hermeneutics/app/modules/home/services/isar_service.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/search_all_apps.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/bottom_nav_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/favorites_apps_widget.dart';
import 'package:launcher_hermeneutics/app/modules/helpers/swipe_detector_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/system_shortcuts_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/upper_nav_widget.dart';
import 'package:launcher_hermeneutics/app/theme/colors.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeStore store;
  late final IsarService isarService;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
    isarService = Modular.get<IsarService>();
    store.getFavoriteApps(isarService: isarService);
    store.updateInstalledApps();
  }

  handleNavigation() async {
    if (store.homePageCurrentState == HomePageCurrentState.favoritesSelector) {
      await store.getFavoriteApps(isarService: isarService);
    }
    if (store.homePageCurrentState == HomePageCurrentState.favorites) {
      store.updateHomeStateTo(newHomeState: HomePageCurrentState.searchAllApps);
    } else {
      store.updateHomeStateTo(newHomeState: HomePageCurrentState.favorites);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        store.homePageCurrentState = HomePageCurrentState.favorites;
      },
      child: Material(
        child: Observer(
          builder: (_) {
            return Stack(
              children: [
                InkWell(
                  onLongPress: () {
                    Modular.to.pushNamed('/settings');
                  },
                  child: SwipeDetector(
                    onSwipeDown: () {
                      store.updateHomeStateTo(
                          newHomeState: HomePageCurrentState.searchAllApps);
                      setState(() {});
                    },
                    onSwipeUp: () {
                      store.homePageCurrentState =
                          HomePageCurrentState.settings;
                    },
                    child: Container(
                      color: black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UpperNav(
                            toggleCalenderView: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 356),
                                ),
                              );
                            },
                          ),
                          if (store.homePageCurrentState ==
                                  HomePageCurrentState.favorites &&
                              store.currentInstalledApps.isNotEmpty) ...[
                            FavoritesAppsWidget(
                                favoritesApps: store.favoriteApps),
                          ],
                          if (store.homePageCurrentState ==
                              HomePageCurrentState.searchAllApps) ...[
                            const SearchAllApps(),
                          ],
                          if (store.homePageCurrentState ==
                              HomePageCurrentState.settings) ...[
                            const SystemShortcutsWidget(),
                          ],
                          BottomNav(
                            openAppsAndSearch: () async {
                              store.updateInstalledApps();
                              handleNavigation();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

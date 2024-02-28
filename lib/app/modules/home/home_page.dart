import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher_hermeneutics/app/modules/home/services/isar_service.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/favorite_selector_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/search_all_apps.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/bottom_nav_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/favorites_apps_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/swipe_detector_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/system_tray_widget.dart';
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
                    store.homePageCurrentState =
                        HomePageCurrentState.favoritesSelector;
                  },
                  child: SwipeDetector(
                    onSwipeDown: () {
                      store.updateHomeStateTo(
                          newHomeState: HomePageCurrentState.searchAllApps);
                      setState(() {});
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
                              HomePageCurrentState.searchAllApps) ...[
                            SearchAllApps(store: store),
                          ],
                          if (store.homePageCurrentState ==
                                  HomePageCurrentState.favorites &&
                              store.currentInstalledApps.isNotEmpty) ...[
                            FavoritesAppsWidget(
                                favoritesApps: store.favoriteApps),
                          ],
                          if (store.homePageCurrentState ==
                              HomePageCurrentState.favoritesSelector) ...[
                            FavoriteSelectorWidget(
                              homeStore: store,
                              onSaveFavorites: () async {
                                await store.saveFavoriteList(
                                    isarService: isarService);
                                store.favoriteApps.clear();
                              },
                            ),
                          ],
                          if (store.homePageCurrentState ==
                              HomePageCurrentState.systemTray) ...[
                            const SystemTray(),
                          ],
                          BottomNav(
                            store: store,
                            openAppsAndSearch: () async {
                              if (store.homePageCurrentState ==
                                  HomePageCurrentState.favoritesSelector) {
                                await store.getFavoriteApps(
                                    isarService: isarService);
                              }
                              if (store.homePageCurrentState ==
                                  HomePageCurrentState.favorites) {
                                store.updateHomeStateTo(
                                    newHomeState:
                                        HomePageCurrentState.searchAllApps);
                              } else {
                                store.updateHomeStateTo(
                                    newHomeState:
                                        HomePageCurrentState.favorites);
                              }
                              setState(() {});
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

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher_hermeneutics/app/modules/helpers/responsive_layout.dart';
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

  bool widgetPositionFoldable = false;

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
            return InkWell(
              onLongPress: () {
                Modular.to.pushNamed('/settings');
              },
              child: Container(
                  color: black,
                  child: ResponsiveLayout(
                    mobileBody: SwipeDetector(
                      onSwipeDown: () {
                        store.updateHomeStateTo(
                            newHomeState: HomePageCurrentState.searchAllApps);
                        setState(() {});
                      },
                      onSwipeUp: () {
                        if (store.homePageCurrentState ==
                            HomePageCurrentState.settings) {
                          store.homePageCurrentState =
                              HomePageCurrentState.favorites;
                        } else {
                          store.homePageCurrentState =
                              HomePageCurrentState.settings;
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: store.homePageCurrentState ==
                                    HomePageCurrentState.favorites
                                ? 1
                                : 115,
                          ),
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
                            SystemShortcutsWidget(
                              systemShortcutWidth:
                                  MediaQuery.of(context).size.width,
                            ),
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
                    tabletBody: SwipeDetector(
                      onSwipeRight: () => setState(() {
                        widgetPositionFoldable = !widgetPositionFoldable;
                      }),
                      onSwipeLeft: () => setState(() {
                        widgetPositionFoldable = !widgetPositionFoldable;
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          if (widgetPositionFoldable == false) ...[
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: FavoritesAppsWidget(
                                      favoritesApps: store.favoriteApps),
                                ),
                                SystemShortcutsWidget(
                                  systemShortcutWidth:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                              ],
                            ),
                          ],
                          if (widgetPositionFoldable == true) ...[
                            Row(
                              children: [
                                SystemShortcutsWidget(
                                  systemShortcutWidth:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: FavoritesAppsWidget(
                                      favoritesApps: store.favoriteApps),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                    desktopBody: Container(),
                  )),
            );
          },
        ),
      ),
    );
  }
}

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/apps_and_search_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/bottom_nav_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/favorites_apps_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/swipe_detector_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/system_tray_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/upper_nav_widget.dart';
import 'package:launcher_hermeneutics/app/theme/bluer_effect.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
    store.getAllApps();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Observer(
          builder: (_) {
            return Stack(
              children: [
                SwipeDetector(
                  onSwipeUp: () {
                    store.updateHomeStateTo(
                        newHomeState: HomePageCurrentState.systemTray);
                    setState(() {});
                  },
                  onSwipeDown: () {
                    store.updateHomeStateTo(
                        newHomeState: HomePageCurrentState.favorites);
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.black,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const UpperNav(),
                          if (store.homePageCurrentState ==
                              HomePageCurrentState.apps) ...[
                            AppsAndSearch(store: store),
                          ],
                          if (store.homePageCurrentState ==
                                  HomePageCurrentState.favorites &&
                              store.currentInstalledApps.isNotEmpty) ...[
                            FavoritesAppsWidget(
                                favoritesApps: store.currentInstalledApps),
                          ],
                          if (store.homePageCurrentState ==
                              HomePageCurrentState.systemTray) ...[
                            SystemTray(),
                          ],
                          BottomNav(
                            openAppsAndSearch: () {
                              if (store.homePageCurrentState ==
                                  HomePageCurrentState.favorites) {
                                store.updateHomeStateTo(
                                    newHomeState: HomePageCurrentState.apps);
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
                Container(
                  child: store.isPopUpMenuOpen == true
                      ? const BlurEffect()
                      : Container(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

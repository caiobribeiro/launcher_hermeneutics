import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:device_apps/device_apps.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

enum HomePageCurrentState { favorites, apps, systemTray }

abstract class HomeStoreBase with Store {
  @observable
  HomePageCurrentState homePageCurrentState = HomePageCurrentState.favorites;

  @action
  void updateHomeStateTo({required HomePageCurrentState newHomeState}) {
    homePageCurrentState = newHomeState;
  }

  @observable
  bool isPopUpMenuOpen = false;

  @observable
  List<Application> currentInstalledApps = [];

  @observable
  List<Application> backupInstalledApps = [];

  @observable
  String cameraPackageName = '';

  @observable
  String phonePackageName = '';

  @action
  void resetInstalledApps() => currentInstalledApps = backupInstalledApps;

  @observable
  @action
  Future<List<Application>> getAllApps() async {
    currentInstalledApps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );
    backupInstalledApps = currentInstalledApps;
    for (var i = 0; i < currentInstalledApps.length; i++) {
      if (currentInstalledApps[i].packageName.contains('dialer')) {
        phonePackageName = currentInstalledApps[i].packageName;
      }
      if (currentInstalledApps[i].packageName.contains('camera')) {
        cameraPackageName = currentInstalledApps[i].packageName;
      }
    }
    return currentInstalledApps;
  }
}

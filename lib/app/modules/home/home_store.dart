import 'package:launcher_hermeneutics/app/modules/home/classes/applications_entity.dart';
import 'package:launcher_hermeneutics/app/modules/home/services/isar_service.dart';
import 'package:mobx/mobx.dart';
import 'package:device_apps/device_apps.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

enum HomePageCurrentState {
  favorites,
  searchAllApps,
  systemTray,
  favoritesSelector
}

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
  List<ApplicationsEntity> favoriteApps = [];

  @observable
  List<Application> backupInstalledApps = [];

  @observable
  String cameraPackageName = '';

  @observable
  String phonePackageName = '';

  @action
  void resetInstalledApps() => currentInstalledApps = backupInstalledApps;

  @action
  Future<void> saveFavoriteList({required IsarService isarService}) async {
    await isarService.deleteAllApps();
    for (var i = 0; i < 6; i++) {
      isarService.addApplication(
        appName: backupInstalledApps[i].appName,
        packageName: backupInstalledApps[i].packageName,
        index: i,
      );
    }
  }

  @action
  Future<void> getFavoriteApps({required IsarService isarService}) async {
    favoriteApps = await isarService.fetchApps();
  }

  @action
  Future<List<Application>> getAllApps() async {
    currentInstalledApps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );
    return currentInstalledApps;
  }

  @action
  Future<void> updateInstalledApps() async {
    currentInstalledApps = await getAllApps();
    backupInstalledApps = currentInstalledApps;
    populateDialer();
    populateCamera();
  }

  @action
  populateDialer() {
    for (var i = 0; i < currentInstalledApps.length; i++) {
      if (currentInstalledApps[i].packageName.contains('dialer')) {
        phonePackageName = currentInstalledApps[i].packageName;
      }
    }
  }

  @action
  populateCamera() {
    for (var i = 0; i < currentInstalledApps.length; i++) {
      if (currentInstalledApps[i].packageName.contains('camera')) {
        cameraPackageName = currentInstalledApps[i].packageName;
      }
    }
  }

  @action
  Future<void> addFavorites(
      {required IsarService isarService,
      required List<Application> newList}) async {
    for (var i = 0; i < newList.length; i++) {
      isarService.addApplication(
          appName: newList[i].appName,
          packageName: newList[i].packageName,
          index: i);
    }
  }
}

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
  @action
  Future<List<Application>> getAllApps() async {
    currentInstalledApps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );
    return currentInstalledApps;
  }
}

import 'package:mobx/mobx.dart';
import 'package:device_apps/device_apps.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  List<Application> currentInstalledApps = [];

  @action
  Future<List<Application>> getAllApps() async {
    currentInstalledApps = await DeviceApps.getInstalledApplications(
        onlyAppsWithLaunchIntent: true, includeSystemApps: true);
    return currentInstalledApps;
  }
}

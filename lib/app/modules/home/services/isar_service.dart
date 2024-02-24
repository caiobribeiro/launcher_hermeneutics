import 'package:isar/isar.dart';
import 'package:launcher_hermeneutics/app/modules/home/classes/applications_entity.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  static late Isar isar;
  static Future<void> initilize() async {
    final dir = await getApplicationSupportDirectory();
    isar = await Isar.open([ApplicationsEntitySchema], directory: dir.path);
  }

  Future<void> addApplication({
    required String appName,
    required String packageName,
    required index,
  }) async {
    final newApplication = ApplicationsEntity()
      ..packageName = packageName
      ..appName = appName
      ..index = index;
    await isar.writeTxn(
      () => isar.applicationsEntitys.put(newApplication),
    );
  }

  Future<List<ApplicationsEntity>> fetchApps() async {
    return await isar.applicationsEntitys.where().findAll();
  }

  Future<bool> updateApp({required ApplicationsEntity app}) async {
    final existingApp = await isar.applicationsEntitys.get(app.id);
    if (existingApp != null) {
      await isar.writeTxn(() => isar.applicationsEntitys.put(app));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isAppInstalled({required ApplicationsEntity app}) async {
    final existingApp = await isar.applicationsEntitys.get(app.id);
    if (existingApp != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> deleteApp(int id) async {
    await isar.writeTxn(() => isar.applicationsEntitys.delete(id));
  }

  Future<void> deleteAllApps() async {
    await isar.writeTxn(() => isar.applicationsEntitys.clear());
  }
}

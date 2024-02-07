import 'package:isar/isar.dart';
import 'package:launcher_hermeneutics/app/modules/home/classes/applications_entity.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  static late Isar isar;
  static Future<void> initilize() async {
    final dir = await getApplicationSupportDirectory();
    isar = await Isar.open([ApplicationsEntitySchema], directory: dir.path);
  }

  final List<ApplicationsEntity> currentApplications = [];

  Future<void> addApplication(
      {required String appName, required String packageName}) async {
    final newApplication = ApplicationsEntity()
      ..packageName = packageName
      ..appName = appName;
    await isar.writeTxn(() => isar.applicationsEntitys.put(newApplication));
  }
}

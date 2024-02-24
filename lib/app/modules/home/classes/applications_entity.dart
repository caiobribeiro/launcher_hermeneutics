import 'package:isar/isar.dart';

part 'applications_entity.g.dart';

@Collection()
class ApplicationsEntity {
  Id id = Isar.autoIncrement;
  late String appName;
  late String packageName;
  late int index;
}

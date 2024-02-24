import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher_hermeneutics/app/modules/home/services/isar_service.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.initilize();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

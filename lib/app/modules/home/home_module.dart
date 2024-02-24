import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher_hermeneutics/app/modules/home/services/isar_service.dart';
import 'home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(HomeStore.new);
    i.addSingleton(IsarService.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}

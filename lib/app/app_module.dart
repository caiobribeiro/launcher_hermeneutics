import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    // i.add(XPTOEmail.new);
    // i.add<EmailService>(XPTOEmailService.new);
    // i.addSingleton(Client.new)
  }

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
  }
}

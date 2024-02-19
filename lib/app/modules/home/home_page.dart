import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/bottom_nav_widget.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/menu_items.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/upper_nav_widget.dart';
import 'package:launcher_hermeneutics/app/theme/blue_effect.dart';
import 'package:popover/popover.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
    store.getAllApps();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              child: Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const UpperNav(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(),
                        SizedBox(
                          height: 400,
                          child: Observer(
                            builder: (context) {
                              if (store.currentInstalledApps.isNotEmpty) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: store.currentInstalledApps.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onLongPress: () {
                                      showPopover(
                                        context: context,
                                        bodyBuilder: (context) =>
                                            const MenuItems(
                                          itemText: ['bruh'],
                                          itemFunction: [],
                                        ),
                                        onPop: () =>
                                            print('Popover was popped!'),
                                        direction: PopoverDirection.bottom,
                                        width: 200,
                                        height: 400,
                                        arrowHeight: 15,
                                        arrowWidth: 30,
                                      );
                                    },
                                    onTap: () => DeviceApps.openApp(
                                      store.currentInstalledApps[index]
                                          .packageName,
                                    ),
                                    child: Text(
                                      store.currentInstalledApps[index].appName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return const Text('bruh');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const BottomNav(),
                ],
              )),
            ),
            store.isPopupMenuOpen == true ? const BlurEffect() : Container(),
          ],
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Center(
          child: Text(
        'Click Me',
        style: TextStyle(color: Colors.white),
      )),
      onTap: () {
        showPopover(
          context: context,
          bodyBuilder: (context) => const MenuItems(
            itemText: ['bruh'],
            itemFunction: [],
          ),
          onPop: () => print('Popover was popped!'),
          direction: PopoverDirection.bottom,
          width: 200,
          height: 400,
          arrowHeight: 15,
          arrowWidth: 30,
        );
      },
    );
  }
}

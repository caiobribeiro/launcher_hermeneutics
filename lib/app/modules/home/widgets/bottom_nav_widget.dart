import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher_hermeneutics/app/modules/home/home_store.dart';

class BottomNav extends StatefulWidget {
  final VoidCallback openAppsAndSearch;
  const BottomNav({
    super.key,
    required this.openAppsAndSearch,
  });

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            DeviceApps.openApp(store.phonePackageName);
          },
          icon: const Icon(
            Icons.phone,
            color: Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () => widget.openAppsAndSearch(),
          icon: Icon(
            store.homePageCurrentState != HomePageCurrentState.favorites
                ? Icons.arrow_back
                : Icons.search,
            color: Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () {
            DeviceApps.openApp(store.cameraPackageName);
          },
          icon: const Icon(
            Icons.camera_alt,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

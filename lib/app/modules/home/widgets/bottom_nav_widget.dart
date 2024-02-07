import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:launcher_hermeneutics/app/modules/home/home_store.dart';

class BottomNav extends StatefulWidget {
  final VoidCallback openAppsAndSearch;
  final HomeStore store;
  const BottomNav(
      {super.key, required this.openAppsAndSearch, required this.store});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            DeviceApps.openApp(widget.store.phonePackageName);
          },
          icon: const Icon(
            Icons.phone,
            color: Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () => widget.openAppsAndSearch(),
          icon: Icon(
            widget.store.homePageCurrentState != HomePageCurrentState.favorites
                ? Icons.arrow_back
                : Icons.search,
            color: Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () {
            DeviceApps.openApp(widget.store.cameraPackageName);
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

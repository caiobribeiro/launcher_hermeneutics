import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final VoidCallback openAppsAndSearch;
  const BottomNav({super.key, required this.openAppsAndSearch});

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
            DeviceApps.openApp('com.google.android.dialer');
          },
          icon: const Icon(
            Icons.phone,
            color: Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () => widget.openAppsAndSearch(),
          icon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () {
            DeviceApps.openApp('com.android.camera2');
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

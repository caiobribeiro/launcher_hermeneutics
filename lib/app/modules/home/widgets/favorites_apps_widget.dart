import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class FavoritesAppsWidget extends StatefulWidget {
  final List<Application> favoritesApps;
  const FavoritesAppsWidget({super.key, required this.favoritesApps});

  @override
  State<FavoritesAppsWidget> createState() => _FavoritesAppsWidgetState();
}

class _FavoritesAppsWidgetState extends State<FavoritesAppsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onLongPress: () {
            DeviceApps.openAppSettings(
              widget.favoritesApps[0].packageName,
            );
          },
          onPressed: () => DeviceApps.openApp(
            widget.favoritesApps[0].packageName,
          ),
          child: Text(
            widget.favoritesApps[0].appName,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextButton(
          onLongPress: () {
            DeviceApps.openAppSettings(
              widget.favoritesApps[1].packageName,
            );
          },
          onPressed: () => DeviceApps.openApp(
            widget.favoritesApps[1].packageName,
          ),
          child: Text(
            widget.favoritesApps[1].appName,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextButton(
          onLongPress: () {
            DeviceApps.openAppSettings(
              widget.favoritesApps[2].packageName,
            );
          },
          onPressed: () => DeviceApps.openApp(
            widget.favoritesApps[2].packageName,
          ),
          child: Text(
            widget.favoritesApps[2].appName,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextButton(
          onLongPress: () {
            DeviceApps.openAppSettings(
              widget.favoritesApps[3].packageName,
            );
          },
          onPressed: () => DeviceApps.openApp(
            widget.favoritesApps[3].packageName,
          ),
          child: Text(
            widget.favoritesApps[3].appName,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextButton(
          onLongPress: () {
            DeviceApps.openAppSettings(
              widget.favoritesApps[4].packageName,
            );
          },
          onPressed: () => DeviceApps.openApp(
            widget.favoritesApps[4].packageName,
          ),
          child: Text(
            widget.favoritesApps[4].appName,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextButton(
          onLongPress: () {
            DeviceApps.openAppSettings(
              widget.favoritesApps[5].packageName,
            );
          },
          onPressed: () => DeviceApps.openApp(
            widget.favoritesApps[5].packageName,
          ),
          child: Text(
            widget.favoritesApps[5].appName,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.favoritesApps.length,
      itemBuilder: (context, index) => TextButton(
        onLongPress: () {
          DeviceApps.openAppSettings(
            widget.favoritesApps[index].packageName,
          );
        },
        onPressed: () => DeviceApps.openApp(
          widget.favoritesApps[index].packageName,
        ),
        child: Text(
          widget.favoritesApps[index].appName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

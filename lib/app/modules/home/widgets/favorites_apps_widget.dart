import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:launcher_hermeneutics/app/modules/home/classes/applications_entity.dart';

class FavoritesAppsWidget extends StatefulWidget {
  final List<ApplicationsEntity> favoritesApps;
  const FavoritesAppsWidget({Key? key, required this.favoritesApps})
      : super(key: key);

  @override
  State<FavoritesAppsWidget> createState() => _FavoritesAppsWidgetState();
}

class _FavoritesAppsWidgetState extends State<FavoritesAppsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.favoritesApps.isEmpty)
          const Text('Long press to choose your favorites apps'),
        if (widget.favoritesApps.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.favoritesApps.length,
            itemBuilder: (BuildContext context, int index) {
              return TextButton(
                onLongPress: () {
                  DeviceApps.openAppSettings(
                    widget.favoritesApps[index].packageName,
                  );
                },
                onPressed: () {
                  DeviceApps.openApp(
                    widget.favoritesApps[index].packageName,
                  );
                },
                child: Text(
                  widget.favoritesApps[index].appName,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

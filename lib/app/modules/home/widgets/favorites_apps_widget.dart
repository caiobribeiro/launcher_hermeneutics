import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
          Column(
            children: [
              const Text(
                  'Long press or tap the button bellow to choose your favorites apps'),
              ElevatedButton(
                onPressed: () => Modular.to.pushNamed('/settings'),
                child: const Text('Go to settings page'),
              ),
            ],
          ),
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

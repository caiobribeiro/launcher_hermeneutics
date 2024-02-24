import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:launcher_hermeneutics/app/modules/home/home_store.dart';

class FavoriteSelectorWidget extends StatefulWidget {
  final HomeStore homeStore;
  final Function onSaveFavorites;

  const FavoriteSelectorWidget(
      {super.key, required this.homeStore, required this.onSaveFavorites});

  @override
  State<FavoriteSelectorWidget> createState() => _FavoriteSelectorWidgetState();
}

class _FavoriteSelectorWidgetState extends State<FavoriteSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('The first six apps will be your favorites'),
        SizedBox(
          height: 400,
          child: Observer(
            builder: (_) {
              List<Widget> myReoderableApps = [];
              for (int index = 0;
                  index < widget.homeStore.backupInstalledApps.length;
                  index += 1) {
                bool isSelected = false;
                myReoderableApps.add(
                  ListTile(
                    key: Key('$index'),
                    tileColor: Colors.white,
                    title: Text(
                        '$index ${widget.homeStore.backupInstalledApps[index].appName}'),
                    selected: isSelected,
                  ),
                );
              }

              return ReorderableListView(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                children: myReoderableApps,
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final Application itemName =
                        widget.homeStore.backupInstalledApps.removeAt(oldIndex);
                    widget.homeStore.backupInstalledApps
                        .insert(newIndex, itemName);
                  });
                },
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSaveFavorites();
          },
          child: const Text('Save selection'),
        ),
      ],
    );
  }
}

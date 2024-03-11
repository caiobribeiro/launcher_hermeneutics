import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher_hermeneutics/app/modules/home/home_store.dart';
import 'package:launcher_hermeneutics/app/modules/home/services/isar_service.dart';

class FavoriteSelectorWidget extends StatefulWidget {
  const FavoriteSelectorWidget({super.key});

  @override
  State<FavoriteSelectorWidget> createState() => _FavoriteSelectorWidgetState();
}

class _FavoriteSelectorWidgetState extends State<FavoriteSelectorWidget> {
  late final HomeStore store;
  late final IsarService isarService;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
    isarService = Modular.get<IsarService>();
  }

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Selection saved'),
    );
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Hold the item and move up or down to define the position',
          ),
          const Text('The first six apps will be your favorites'),
          ElevatedButton(
            onPressed: () async {
              await store.saveFavoriteList(isarService: isarService);
              store.favoriteApps.clear();
              await store.updateInstalledApps();
              await store.getFavoriteApps(isarService: isarService);
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Modular.to.pop();
            },
            child: const Text('Save selection'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Observer(
              builder: (_) {
                List<Widget> myReoderableApps = [];
                for (int index = 0;
                    index < store.backupInstalledApps.length;
                    index += 1) {
                  bool isSelected = false;
                  myReoderableApps.add(
                    ListTile(
                      key: Key('$index'),
                      title: Text(
                          '$index - ${store.backupInstalledApps[index].appName}'),
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
                          store.backupInstalledApps.removeAt(oldIndex);
                      store.backupInstalledApps.insert(newIndex, itemName);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: unused_local_variable

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:launcher_hermeneutics/app/modules/home/home_store.dart';

class SearchAllApps extends StatefulWidget {
  final HomeStore store;
  const SearchAllApps({super.key, required this.store});

  @override
  State<SearchAllApps> createState() => _SearchAllAppsState();
}

class _SearchAllAppsState extends State<SearchAllApps> {
  Offset _tapPosition = Offset.zero;
  final TextEditingController textEditingController = TextEditingController();

  void _getTapPosition(TapDownDetails tapPosition) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(tapPosition.globalPosition);
    });
  }

  void _showContextMenu(
      {required BuildContext context,
      required List<PopupMenuItem> menuItems}) async {
    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();
    final result = await showMenu(
      context: context,
      position: RelativeRect.fromRect(
          Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 100, 100),
          Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
              overlay.paintBounds.size.height)),
      items: menuItems,
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void searchApp(String query) {
      widget.store.currentInstalledApps = widget.store.backupInstalledApps;
      final suggestions = widget.store.currentInstalledApps.where((app) {
        final appTitle = app.appName.toLowerCase();
        final input = query.toLowerCase();
        return appTitle.contains(input);
      }).toList();
      if (suggestions.length == 1) {
        final tempPackageName = suggestions[0].packageName;
        widget.store.currentInstalledApps = widget.store.backupInstalledApps;

        setState(() {});
        DeviceApps.openApp(tempPackageName);
      } else {
        setState(() {
          widget.store.currentInstalledApps = suggestions;
        });
      }
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  autofocus: true,
                  controller: textEditingController,
                  textAlign: TextAlign.center,
                  onChanged: (query) {
                    searchApp(query);
                    textEditingController.text = query;
                    setState(() {});
                  },
                ),
              ),
              if (textEditingController.text != '')
                IconButton(
                  onPressed: () {
                    textEditingController.clear();
                    widget.store.resetInstalledApps();
                    setState(() {});
                  },
                  icon: const Icon(Icons.clear),
                ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 400,
            child: Observer(
              builder: (context) {
                if (widget.store.currentInstalledApps.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.store.currentInstalledApps.length,
                    itemBuilder: (context, index) {
                      final application = widget.store
                          .currentInstalledApps[index] as ApplicationWithIcon;
                      return GestureDetector(
                        onTapDown: (position) {
                          _getTapPosition(position);
                        },
                        onTapCancel: () {},
                        onLongPress: () {
                          _showContextMenu(
                            context: context,
                            menuItems: [
                              PopupMenuItem(
                                value: "Information",
                                onTap: () {
                                  DeviceApps.openAppSettings(
                                    widget.store.currentInstalledApps[index]
                                        .packageName,
                                  );
                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.info),
                                    SizedBox(width: 10),
                                    Text('Information'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: "Information",
                                onTap: () {
                                  DeviceApps.uninstallApp(
                                    widget.store.currentInstalledApps[index]
                                        .packageName,
                                  );
                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.delete),
                                    SizedBox(width: 10),
                                    Text('Delete'),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        child: TextButton(
                          onPressed: () => {
                            DeviceApps.openApp(
                              widget.store.currentInstalledApps[index]
                                  .packageName,
                            ),
                            textEditingController.clear(),
                            widget.store.resetInstalledApps(),
                            widget.store.homePageCurrentState =
                                HomePageCurrentState.favorites,
                          },
                          child: Text(
                            widget.store.currentInstalledApps[index].appName,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Column(
                    children: [
                      Text('No APPs found'),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

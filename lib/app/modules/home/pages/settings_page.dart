import 'package:flutter/material.dart';
import 'package:launcher_hermeneutics/app/modules/home/widgets/favorite_selector_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Column(
        children: [
          FavoriteSelectorWidget(),
        ],
      ),
    );
  }
}

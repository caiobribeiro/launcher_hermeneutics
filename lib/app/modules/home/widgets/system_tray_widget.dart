import 'package:flutter/material.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';

class SystemTray extends StatefulWidget {
  const SystemTray({super.key});

  @override
  State<SystemTray> createState() => _SystemTrayState();
}

class _SystemTrayState extends State<SystemTray> {
  double _volume = 0;
  bool _showSystemSlider = false;
  @override
  void initState() {
    super.initState();
    FlutterVolumeController.addListener((volume) {
      setState(() {
        _volume = volume;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: Slider(
            value: _volume,
            onChanged: (value) {
              setState(() {
                FlutterVolumeController.setVolume(value);
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Volume: ${_volume.toString()}',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Show system slider'),
            Checkbox(
              value: _showSystemSlider,
              onChanged: (value) {
                final checked = value ?? true;
                FlutterVolumeController.updateShowSystemUI(checked);
                setState(() {
                  _showSystemSlider = checked;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

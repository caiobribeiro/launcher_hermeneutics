import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:interactive_slider/interactive_slider.dart';
import 'package:launcher_hermeneutics/app/modules/home/home_store.dart';
import 'package:torch_light/torch_light.dart';

class SystemShortcutsWidget extends StatefulWidget {
  const SystemShortcutsWidget({super.key});

  @override
  State<SystemShortcutsWidget> createState() => _SystemShortcutsWidgetState();
}

class _SystemShortcutsWidgetState extends State<SystemShortcutsWidget> {
  late final HomeStore store;

  String torchStatus = '';
  bool isTorchAvailable = false;
  bool isTorchOn = false;

  double _volume = 0;
  double _lastVolumeMuted = 0;
  bool _isMute = false;

  checkForTourchAvailability() async {
    try {
      isTorchAvailable = await TorchLight.isTorchAvailable();
      if (isTorchAvailable) {
        torchStatus = '';
      }
      setState(() {});
    } on Exception catch (error) {
      torchStatus = error.toString();
    }
  }

  toggleTorch() async {
    if (!isTorchOn) {
      try {
        await TorchLight.enableTorch();
        isTorchOn = true;
        setState(() {});
      } on EnableTorchExistentUserException catch (_) {
        torchStatus = ' The camera is in use';
        setState(() {});
      } on EnableTorchNotAvailableException catch (_) {
        torchStatus = ' Torch was not detected';
        setState(() {});
      } on EnableTorchException catch (_) {
        torchStatus = ' Torch could not be enabled due to another error';
        setState(() {});
      }
    } else {
      try {
        await TorchLight.disableTorch();
        isTorchOn = false;
        setState(() {});
      } on DisableTorchExistentUserException catch (_) {
        torchStatus = 'The camera is in use';
        setState(() {});
      } on DisableTorchNotAvailableException catch (_) {
        torchStatus = ' Torch was not detected';
        setState(() {});
      } on DisableTorchException catch (_) {
        torchStatus = ' Torch could not be disabled due to another error';
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
    FlutterVolumeController.addListener((volume) {
      setState(() {
        _volume = volume;
      });
    });
    FlutterVolumeController.updateShowSystemUI(false);
    checkForTourchAvailability();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 400,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                DeviceApps.openApp(store.settingsPackageName);
                store.homePageCurrentState = HomePageCurrentState.favorites;
              },
              icon: const Icon(
                Icons.settings,
                size: 40,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                DeviceApps.openApp(store.clockPackageName);
                store.homePageCurrentState = HomePageCurrentState.favorites;
              },
              icon: const Icon(
                Icons.alarm,
                size: 40,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                if (_isMute) {
                  _volume = _lastVolumeMuted;
                  FlutterVolumeController.setVolume(_lastVolumeMuted);
                  _isMute = false;
                } else {
                  _lastVolumeMuted = _volume;
                  FlutterVolumeController.setVolume(0);
                  _volume = 0;
                  _isMute = true;
                }

                setState(() {});
              },
              icon: Icon(
                _isMute == false ? Icons.volume_down_alt : Icons.volume_mute,
                size: 40,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                toggleTorch();
              },
              icon: Icon(
                isTorchOn == false ? Icons.flashlight_off : Icons.flashlight_on,
                size: 40,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .97,
          child: InteractiveSlider(
            iconPosition: IconPosition.below,
            startIcon: const Icon(CupertinoIcons.volume_down),
            endIcon: const Icon(CupertinoIcons.volume_up),
            iconSize: 28,
            centerIcon: Text(_isMute == false
                ? 'Volume ${(_volume * 100).toStringAsFixed(0)}%'
                : 'Mute'),
            onChanged: (value) {
              setState(() {
                FlutterVolumeController.setVolume(value);
              });
            },
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Text('Show system slider'),
        //     Checkbox(
        //       value: _showSystemSlider,
        //       onChanged: (value) {
        //         final checked = value ?? true;
        //         FlutterVolumeController.updateShowSystemUI(checked);
        //         setState(() {
        //           _showSystemSlider = checked;
        //         });
        //       },
        //     ),
        //   ],
        // ),
      ],
    );
  }
}

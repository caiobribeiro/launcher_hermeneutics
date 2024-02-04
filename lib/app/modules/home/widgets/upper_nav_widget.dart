import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class UpperNav extends StatefulWidget {
  const UpperNav({super.key});

  @override
  State<UpperNav> createState() => _UpperNavState();
}

class _UpperNavState extends State<UpperNav> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.watch_later,
            color: Colors.white,
          ),
        ),
        TextButton(
          onPressed: () {
            CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now(),
                onDateChanged: (a) {});
          },
          child: Text(
            '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpperNav extends StatefulWidget {
  final VoidCallback toggleCalenderView;
  const UpperNav({super.key, required this.toggleCalenderView});

  @override
  State<UpperNav> createState() => _UpperNavState();
}

class _UpperNavState extends State<UpperNav> {
  bool isCalanderOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: widget.toggleCalenderView,
              child: Text(
                DateFormat('dd/MM/yyyy').format(DateTime.now()),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

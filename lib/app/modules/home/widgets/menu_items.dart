import 'package:flutter/material.dart';

class MenuItems extends StatefulWidget {
  final List<String> itemText;
  final List<Function> itemFunction;
  const MenuItems(
      {super.key, required this.itemText, required this.itemFunction});

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.itemText.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Colors.black54,
              child: InkWell(
                onTap: () => widget.itemFunction[index],
                child: Text(
                  widget.itemText[index],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

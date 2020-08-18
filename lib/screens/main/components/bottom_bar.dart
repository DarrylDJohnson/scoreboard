import 'package:flutter/material.dart';

import 'menu_bottom_sheet.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 4.0,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => buildMenuBottomSheet(context)
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scoreboard/models/scoreboard.dart';

import 'menu_bottom_sheet.dart';

class BottomBar extends StatefulWidget {
  final PageController pageController;
  final List<Scoreboard> scoreboards;
  final Function(String) onCreateScoreboard;

  const BottomBar({
    Key key,
    this.pageController,
    this.scoreboards,
    this.onCreateScoreboard,
  }) : super(key: key);

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
            onPressed: () => buildMenuBottomSheet(
              context,
              pageController: widget.pageController,
              scoreboards: widget.scoreboards,
              onCreateScoreboard: widget.onCreateScoreboard,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scoreboard/models/scoreboard.dart';

import 'create_scoreboard_bottom_sheet.dart';

buildMenuBottomSheet(BuildContext context,
        {@required PageController pageController,
        @required List<Scoreboard> scoreboards,
        @required Function(String) onCreateScoreboard}) =>
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      builder: (context) => MenuBottomSheet(
        pageController: pageController,
        scoreboards: scoreboards,
        onCreateScoreboard: onCreateScoreboard,
      ),
    );

class MenuBottomSheet extends StatelessWidget {
  final PageController pageController;
  final List<Scoreboard> scoreboards;
  final Function(String) onCreateScoreboard;

  const MenuBottomSheet({
    Key key,
    @required this.pageController,
    @required this.scoreboards,
    @required this.onCreateScoreboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black12,
          ),
          title: Text("My Account"),
        ),
        Divider(color: Colors.black38),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(scoreboards[index].name),
              onTap: () {
                pageController.jumpToPage(index + 1);
                Navigator.of(context).pop(this);
              },
            ),
            itemCount: scoreboards.length,
          ),
        ),
        Divider(color: Colors.black38),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Create Scoreboard"),
          onTap: () => showCreateScoreboardBottomSheet(
            context,
            onCreateScoreboard: onCreateScoreboard,
          ),
        )
      ],
    );
  }
}

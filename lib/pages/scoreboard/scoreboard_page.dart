import 'package:flutter/material.dart';
import 'package:scoreboard/models/scoreboard.dart';

class ScoreboardPage extends StatelessWidget {
  final Scoreboard scoreboard;
  final PageController pageController;

  const ScoreboardPage({
    Key key,
    this.scoreboard,
    this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _buildList() {
      return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(scoreboard.scores[index].toString()),
        ),
        itemCount: scoreboard.scores.length,
      );
    }

    _buildEmptyList() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_to_photos,
            size: 96.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text(
              'No Scores',
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              'Add teams to start tracking scores',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => pageController.jumpToPage(0),
          ),
          title: Text(
            scoreboard.name,
          ),
        ),
        Expanded(
          child:
              scoreboard.scores.length > 0 ? _buildList() : _buildEmptyList(),
        )
      ],
    );
  }
}

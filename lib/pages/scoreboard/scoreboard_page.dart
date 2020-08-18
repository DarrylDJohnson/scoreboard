import 'package:flutter/material.dart';
import 'package:scoreboard/models/scoreboard.dart';
import 'package:scoreboard/models/scorecard.dart';
import 'package:scoreboard/screens/main/components/create_scorecard_bottom_sheet.dart';

import 'components/scorecard_tile.dart';

class ScoreboardPage extends StatefulWidget {
  final Scoreboard scoreboard;
  final PageController pageController;

  const ScoreboardPage({
    Key key,
    this.scoreboard,
    this.pageController,
  }) : super(key: key);

  @override
  _ScoreboardPageState createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {
  @override
  Widget build(BuildContext context) {
    _buildList() {
      return ListView.builder(
        itemBuilder: (context, index) {
          Scorecard scorecard = widget.scoreboard.scores[index];

          return ScorecardTile(
            scorecard: widget.scoreboard.scores[index],
            onEdit: () => showCreateScorecardBottomSheet(
              context,
              initialText: scorecard.name,
              onScoreboardCreated: (name) {
                setState(
                  () {
                    widget.scoreboard.scores[index].name = name;
                  },
                );
              },
            ),
            onDelete: () =>
                setState(() => widget.scoreboard.scores.removeAt(index)),
            onUndo: () =>
                setState(() => widget.scoreboard.scores.add(scorecard)),
          );
        },
        itemCount: widget.scoreboard.scores.length,
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
            onPressed: () => widget.pageController.jumpToPage(0),
          ),
          title: Text(
            widget.scoreboard.name,
          ),
        ),
        Expanded(
          child: widget.scoreboard.scores.length > 0
              ? _buildList()
              : _buildEmptyList(),
        )
      ],
    );
  }
}

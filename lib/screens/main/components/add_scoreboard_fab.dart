import 'package:flutter/material.dart';
import 'package:scoreboard/models/scoreboard.dart';
import 'package:scoreboard/screens/main/components/create_scoreboard_bottom_sheet.dart';
import 'package:scoreboard/screens/main/components/create_scorecard_bottom_sheet.dart';

class AddScoreboardFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(Icons.add),
      label: Text("Add scoreboard"),
      onPressed: () => showCreateScoreBoardBottomSheet(context),
    );
  }
}

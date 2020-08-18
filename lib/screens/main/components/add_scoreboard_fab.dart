import 'package:flutter/material.dart';
import 'package:scoreboard/models/scoreboard.dart';
import 'package:scoreboard/screens/main/components/create_scoreboard_bottom_sheet.dart';
import 'package:scoreboard/screens/main/components/create_scorecard_bottom_sheet.dart';

class AddScoreboardFAB extends StatelessWidget {

  final Function(String) onCreateScoreboard;

  const AddScoreboardFAB({Key key, @required this.onCreateScoreboard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(Icons.add),
      label: Text("Add scoreboard"),
      onPressed: () => showCreateScoreboardBottomSheet(context, onCreateScoreboard: onCreateScoreboard),
    );
  }
}

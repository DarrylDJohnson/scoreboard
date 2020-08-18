import 'package:flutter/material.dart';
import 'package:scoreboard/models/scoreboard.dart';
import 'package:scoreboard/screens/main/components/create_scorecard_bottom_sheet.dart';

class AddScorecardFAB extends StatelessWidget {
  final Scoreboard scoreboard;

  const AddScorecardFAB({Key key, this.scoreboard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(Icons.add),
      label: Text('add scorecard'),
      onPressed: () =>
          showCreateScorecardBottomSheet(context, scoreboard: scoreboard),
    );
  }
}

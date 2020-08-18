import 'package:flutter/material.dart';
import 'package:scoreboard/screens/main/components/create_scorecard_bottom_sheet.dart';

class AddScorecardFAB extends StatelessWidget {
  final Function(String) onScoreboardCreated;

  const AddScorecardFAB({Key key, this.onScoreboardCreated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(Icons.add),
      label: Text('add scorecard'),
      onPressed: () => showCreateScorecardBottomSheet(
        context,
        onScoreboardCreated: onScoreboardCreated,
      ),
    );
  }
}

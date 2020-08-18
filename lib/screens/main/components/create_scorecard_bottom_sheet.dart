import 'package:flutter/material.dart';
import 'package:scoreboard/models/scoreboard.dart';

showCreateScorecardBottomSheet(BuildContext context, {@required Scoreboard scoreboard}) => showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      builder: (context) => CreateScorecardBottomSheet(scoreboard: scoreboard),
    );

class CreateScorecardBottomSheet extends StatefulWidget {

  final Scoreboard scoreboard;

  const CreateScorecardBottomSheet({Key key, @required this.scoreboard}) : super(key: key);

  @override
  _CreateScorecardBottomSheetState createState() =>
      _CreateScorecardBottomSheetState();
}

class _CreateScorecardBottomSheetState
    extends State<CreateScorecardBottomSheet> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _controller,
          textInputAction: TextInputAction.done,
          onSubmitted: (name) => () {
            widget.scoreboard.scores.addAll({name: 0});
            Navigator.of(context).pop(this);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              child: Text("Close"),
              textColor: Colors.black45,
              onPressed: () => Navigator.of(context).pop(this),
            ),
            FlatButton(
              child: Text("Done"),
              textColor: Theme.of(context).accentColor,
              onPressed: () => () {
                widget.scoreboard.scores.addAll({_controller.text: 0});
                Navigator.of(context).pop(this);
              },
            ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

showCreateScorecardBottomSheet(
  BuildContext context, {
  String initialText = '',
  @required Function(String) onScoreboardCreated,
}) =>
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      builder: (context) => CreateScorecardBottomSheet(
        onScoreboardCreated: onScoreboardCreated,
        initialText: initialText,
      ),
    );

class CreateScorecardBottomSheet extends StatefulWidget {
  final Function(String) onScoreboardCreated;
  final String initialText;

  const CreateScorecardBottomSheet({
    Key key,
    @required this.onScoreboardCreated,
    this.initialText = "",
  }) : super(key: key);

  @override
  _CreateScorecardBottomSheetState createState() =>
      _CreateScorecardBottomSheetState();
}

class _CreateScorecardBottomSheetState
    extends State<CreateScorecardBottomSheet> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialText);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ListTile(
        title: TextField(
          controller: _controller,
          textInputAction: TextInputAction.done,
          onSubmitted: (name) {
            widget.onScoreboardCreated(name);
            Navigator.of(context).pop(this);
          },
        ),
        subtitle: Row(
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
              onPressed: () {
                widget.onScoreboardCreated(_controller.text);
                Navigator.of(context).pop(this);
              },
            ),
          ],
        ),
      ),
    );
  }
}

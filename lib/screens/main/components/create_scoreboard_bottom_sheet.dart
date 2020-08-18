import 'package:flutter/material.dart';

showCreateScoreboardBottomSheet(
  BuildContext context, {
  @required Function(String) onCreateScoreboard,
}) =>
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      builder: (context) => CreateScoreboardBottomSheet(
        onCreateScoreboard: onCreateScoreboard,
      ),
    );

class CreateScoreboardBottomSheet extends StatefulWidget {
  final Function(String) onCreateScoreboard;

  const CreateScoreboardBottomSheet({Key key, this.onCreateScoreboard})
      : super(key: key);

  @override
  _CreateScoreboardBottomSheetState createState() =>
      _CreateScoreboardBottomSheetState();
}

class _CreateScoreboardBottomSheetState
    extends State<CreateScoreboardBottomSheet> {
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
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ListTile(
          title: TextField(
            controller: _controller,
            textInputAction: TextInputAction.done,
            onSubmitted: (name) {
              widget.onCreateScoreboard(name);
              Navigator.of(context).pop(this);
            },
            decoration: InputDecoration(
              hintText: "Create scoreboard",
              border: InputBorder.none,
            ),
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
                  widget.onCreateScoreboard(_controller.text);
                  Navigator.of(context).pop(this);
                },
              ),
            ],
          )),
    );
  }
}

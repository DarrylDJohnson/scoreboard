import 'package:flutter/material.dart';
import 'package:scoreboard/models/scorecard.dart';

class ScorecardTile extends StatefulWidget {
  final Scorecard scorecard;
  final Function() onEdit;
  final Function() onDelete;
  final Function() onUndo;

  const ScorecardTile({
    Key key,
    this.scorecard,
    this.onEdit,
    this.onDelete,
    this.onUndo,
  }) : super(key: key);

  @override
  _ScorecardTileState createState() => _ScorecardTileState();
}

class _ScorecardTileState extends State<ScorecardTile> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.scorecard.name),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Material(
          color: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Center(
              child: Text(
                widget.scorecard.score.toString(),
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        title: Text(
          widget.scorecard.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline5,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MaterialButton(
              child: Icon(
                Icons.add,
                color: Theme.of(context).accentColor,
              ),
              onPressed: _increment,
            ),
            MaterialButton(
              child: Icon(
                Icons.minimize,
                color: Theme.of(context).accentColor,
              ),
              onPressed: _decrement,
            ),
          ],
        ),
        onLongPress: widget.onEdit,
      ),
      background: Container(
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.centerRight,
        color: Theme.of(context).accentColor,
        child: Icon(
          Icons.delete_outline,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) => _delete(),
    );
  }

  _increment() {
    setState(() {
      widget.scorecard.increment();
    });
  }

  _decrement() {
    setState(() {
      widget.scorecard.decrement();
    });
  }

  _delete() {
    widget.onDelete();

    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("${widget.scorecard.name}'s score was removed"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: widget.onUndo,
        ),
      ),
    );
  }
}

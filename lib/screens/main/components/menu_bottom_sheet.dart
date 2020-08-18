import 'package:flutter/material.dart';

buildMenuBottomSheet(BuildContext context) => showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      builder: (context) => MenuBottomSheet(),
    );

class MenuBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black12,
          ),
          title: Text("My Account"),
        ),
        Divider(color: Colors.black38),
        Expanded(
          child: Column(
          ),
        ),
        Divider(color: Colors.black38),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Create Scoreboard"),
        )
      ],
    );
  }
}

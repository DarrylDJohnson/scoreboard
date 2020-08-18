import 'package:flutter/material.dart';
import 'package:scoreboard/models/scoreboard.dart';

class HomePage extends StatelessWidget {
  final PageController pageController;
  final List<Scoreboard> scoreboards;

  const HomePage({
    Key key,
    @required this.pageController,
    @required this.scoreboards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(scoreboards[index].name),
              onTap: () => pageController.jumpToPage(index + 1),
            ),
            itemCount: scoreboards.length,
          ),
        )
      ],
    );
  }
}

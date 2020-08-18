import 'package:flutter/material.dart';
import 'package:scoreboard/models/scoreboard.dart';
import 'package:scoreboard/pages/home/home_page.dart';
import 'package:scoreboard/pages/scoreboard/scoreboard_page.dart';
import 'package:scoreboard/screens/main/components/add_scorecard_fab.dart';

import 'components/add_scoreboard_fab.dart';
import 'components/bottom_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _controller;
  double _currentPage = 0;

  @override
  void initState() {
    _controller = PageController()..addListener(() {
      setState(() {
        _currentPage = _controller.page;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemBuilder: (context, index) {
            return index == 0
                ? HomePage(pageController: _controller)
                : ScoreboardPage(
                    pageController: _controller,
                    scoreboard: scoreboards[index - 1],
                  );
          },
          itemCount: scoreboards.length + 1,
          controller: _controller,
        ),
        floatingActionButton:
            _currentPage < 0.5 ? AddScoreboardFAB() : AddScorecardFAB(),
        bottomNavigationBar: BottomBar(pageController: _controller),
      ),
    );
  }
}

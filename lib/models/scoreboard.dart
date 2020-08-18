import 'package:scoreboard/models/scorecard.dart';

class Scoreboard {
  final String id;
  final String name;
  final List<String> initialScores;
  List<Scorecard> scores;

  Scoreboard({
    this.id = '',
    this.name = '',
    this.initialScores,
  }): this.scores = initialScores ?? [];

  addScorecard(Scorecard scorecard){
    scores.add(scorecard);
  }
}
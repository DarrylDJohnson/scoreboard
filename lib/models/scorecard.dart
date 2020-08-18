class Scorecard{
  String name;
  int score;

  Scorecard({this.name = "", this.score = 0});

  increment(){
    score ++;
  }

  decrement(){
    score--;
  }
}
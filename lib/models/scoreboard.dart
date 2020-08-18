import 'package:flutter/material.dart';

class Scoreboard {
  final String id;
  final String name;
  final Map<String, int> scores;

  Scoreboard({
    this.id = '',
    this.name = '',
    this.scores = const {},
  });
}
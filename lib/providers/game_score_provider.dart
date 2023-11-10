import 'package:flutter/material.dart';

class GameScoreProvider extends ChangeNotifier {
  int score = 0;

  setScore(int sc){
    score += sc;
    notifyListeners();
  }

  reset(){
    score = 0;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:roulette_project/enums/game_status.dart';

class GameProvider extends ChangeNotifier {
  int wheelValue = -1;
  GameStatus gameStatus = GameStatus.idle;

  onWheelSet(int value){
    // fired on wheel value set
    wheelValue = value;
    gameStatus = GameStatus.wheelSet;
    notifyListeners();
  }

  reset(){
    wheelValue = -1;
    gameStatus = GameStatus.idle;
    notifyListeners();
  }
}
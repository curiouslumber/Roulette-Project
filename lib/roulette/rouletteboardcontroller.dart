import 'package:get/get.dart';

class RouletteBoardController extends GetxController {
  var bets = [].obs;
  var betOn = true.obs;

  var betsOnBoard = List<bool>.filled(36, false).obs;
  var zeroBets = List<bool>.filled(2, false).obs;
  var betsOnBoardCount = List<int>.filled(36, 0).obs;
  var zeroBetsCount = List<int>.filled(2, 0).obs;
  var wheelSpinning = false.obs;
  var spinning = false.obs;
  var cornerBets = List<bool>.filled(39, false).obs;
  var betValue = 1;
  var totalBetAmount = 0.obs;
  var spinResult = 0.obs;

  var straightUpMultiplier = 35;
  var splitMultiplier = 17;
  var streetMultiplier = 11;
  var cornerMultiplier = 8;
  var doubleStreetMultiplier = 5;

  var dozenMultiplier = 2;
  var columnMultiplier = 2;
  var evenOddMultiplier = 1;
  var colorMultiplier = 1;
  var lowHighMultiplier = 1;

  void addZeroBet(int index) {
    zeroBetsCount[index - 1]++;
    if (!zeroBets[index - 1]) {
      zeroBets[index - 1] = true;
    }
    totalBetAmount.value += betValue;
  }

  void activeBet(int index) {
    betsOnBoardCount[index - 1]++;
    if (!betsOnBoard[index - 1]) {
      betsOnBoard[index - 1] = true;
    }
    totalBetAmount.value += betValue;
  }

  void activeFirst12() {
    for (var i = 0; i < 12; i++) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 12;
  }

  void activeSecond12() {
    for (var i = 12; i < 24; i++) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 12;
  }

  void activeThird12() {
    for (var i = 24; i < 36; i++) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 12;
  }

  void activeFirstColumn() {
    for (var i = 0; i < 36; i += 3) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 12;
  }

  void activeSecondColumn() {
    for (var i = 1; i < 36; i += 3) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 12;
  }

  void activeThirdColumn() {
    for (var i = 2; i < 36; i += 3) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 12;
  }

  void activeEven() {
    for (var i = 0; i < 36; i += 2) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 18;
  }

  void activeOdd() {
    for (var i = 1; i < 36; i += 2) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 18;
  }

  void active1to18() {
    for (var i = 0; i < 18; i++) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 18;
  }

  void active19to36() {
    for (var i = 18; i < 36; i++) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 18;
  }

  void activeRed() {
    var redIndexes = [
      1,
      3,
      5,
      7,
      9,
      12,
      14,
      16,
      18,
      19,
      21,
      23,
      25,
      27,
      30,
      32,
      34,
      36
    ];

    for (var i = 0; i < redIndexes.length; i++) {
      betsOnBoard[redIndexes[i] - 1] = true;
    }
    totalBetAmount += betValue * 18;
  }

  void activeBlack() {
    var blackIndexes = [
      2,
      4,
      6,
      8,
      10,
      11,
      13,
      15,
      17,
      20,
      22,
      24,
      26,
      28,
      29,
      31,
      33,
      35
    ];

    for (var i = 0; i < blackIndexes.length; i++) {
      betsOnBoard[blackIndexes[i] - 1] = true;
    }
    totalBetAmount += betValue * 18;
  }

  void printBets() {
    print(betsOnBoard);
  }
}

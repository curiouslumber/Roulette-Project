import 'package:get/get.dart';

class RouletteBoardController extends GetxController {
  var bets = [].obs;
  var betOn = true.obs;

  var betsOnBoard = List<bool>.filled(36, false).obs;
  var betsOnBoardCount = List<int>.filled(36, 0).obs;
  var wheelSpinning = false.obs;
  var spinning = false.obs;
  var cornerBets = List<bool>.filled(39, false).obs;

  void activeBet(int index) {
    betsOnBoardCount[index - 1]++;
    if (!betsOnBoard[index - 1]) {
      betsOnBoard[index - 1] = true;
    }
  }

  void activeFirst12() {
    for (var i = 0; i < 12; i++) {
      betsOnBoard[i] = true;
    }
  }

  void activeSecond12() {
    for (var i = 12; i < 24; i++) {
      betsOnBoard[i] = true;
    }
  }

  void activeThird12() {
    for (var i = 24; i < 36; i++) {
      betsOnBoard[i] = true;
    }
  }

  void activeFirstColumn() {
    for (var i = 0; i < 36; i += 3) {
      betsOnBoard[i] = true;
    }
  }

  void activeSecondColumn() {
    for (var i = 1; i < 36; i += 3) {
      betsOnBoard[i] = true;
    }
  }

  void activeThirdColumn() {
    for (var i = 2; i < 36; i += 3) {
      betsOnBoard[i] = true;
    }
  }

  void activeEven() {
    for (var i = 0; i < 36; i += 2) {
      betsOnBoard[i] = true;
    }
  }

  void activeOdd() {
    for (var i = 1; i < 36; i += 2) {
      betsOnBoard[i] = true;
    }
  }

  void active1to18() {
    for (var i = 0; i < 18; i++) {
      betsOnBoard[i] = true;
    }
  }

  void active19to36() {
    for (var i = 18; i < 36; i++) {
      betsOnBoard[i] = true;
    }
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
  }

  void printBets() {
    print(betsOnBoard);
  }
}

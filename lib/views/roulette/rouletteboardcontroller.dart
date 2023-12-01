import 'package:get/get.dart';

class RouletteBoardController extends GetxController {
  var bets = [].obs;
  var betOn = true.obs;

  var moveNum = 0.obs;
  var gameStatus = "none".obs;

  var betsOnBoard = List<bool>.filled(36, false).obs;
  var zeroBets = List<bool>.filled(2, false).obs;
  var betsOnBoardCount = List<int>.filled(36, 0).obs;
  var zeroBetsCount = List<int>.filled(2, 0).obs;
  var wheelSpinning = false.obs;
  var spinning = false.obs;
  var cornerBets = List<bool>.filled(52, false).obs;
  var verticalSideBets = List<bool>.filled(33, false).obs;
  var horizontalSideBets = List<bool>.filled(24, false).obs;
  var streetBets = List<bool>.filled(24, false).obs;
  var zeroSideBets = List<bool>.filled(4, false).obs;
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

  var betSizes = [];
  List<List<int>> betsInInt = List<List<int>>.empty(growable: true);
  var userResult = "You".obs;
  var userWon = false.obs;
  var totalAmountWon = 0.obs;
  var userBalance = 0.obs;

  void calculateBet() {
    for (int i = 0; i < bets.length; i++) {
      if (bets[i].toString().contains("[") == false) {
        betsInInt.add([int.parse(bets[i])]);
      } else if (bets[i].toString().contains("[") == true) {
        var temp = bets[i].toString().split("[");
        var temp2 = temp[1].toString().split("]");
        var temp3 = temp2[0].toString().split(",");
        var temp4 = List<int>.empty(growable: true);
        for (int j = 0; j < temp3.length; j++) {
          temp4.add(int.parse(temp3[j]));
        }
        betsInInt.add(temp4);
      }
      betSizes.add(betsInInt[i].length);
    }

    print(betSizes);
  }

  void checkBet(int spinResult) {
    totalAmountWon.value = 0;
    print(betsInInt);
    for (int i = 0; i < betsInInt.length; i++) {
      for (int j = 0; j < betsInInt[i].length; j++) {
        if (betsInInt[i][j] == spinResult) {
          userWon.value = true;
          userResult.value = "You won";
          if (betSizes[i] == 1) {
            totalAmountWon.value =
                betSizes[i] * straightUpMultiplier * betValue;
          } else if (betSizes[i] == 2) {
            totalAmountWon.value = betSizes[i] * splitMultiplier * betValue;
          } else if (betSizes[i] == 3) {
            totalAmountWon.value = betSizes[i] * streetMultiplier * betValue;
          } else if (betSizes[i] == 4) {
            totalAmountWon.value = betSizes[i] * cornerMultiplier * betValue;
          } else if (betSizes[i] == 6) {
            totalAmountWon.value =
                betSizes[i] * doubleStreetMultiplier * betValue;
          } else if (betSizes[i] == 12) {
            totalAmountWon.value = betSizes[i] * dozenMultiplier * betValue;
          } else if (betSizes[i] == 18) {
            totalAmountWon.value = betSizes[i] * lowHighMultiplier * betValue;
          }
          print(totalAmountWon.value);
          userBalance.value += totalAmountWon.value;
        }
      }
    }
    if (userWon.value == false) {
      print(userWon.value);
      userResult.value = "You lost";
    }
  }

  void addZeroBet(int index) {
    if (totalBetAmount.value + betValue > userBalance.value) {
      print("Not enough money");
      return;
    }

    zeroBetsCount[index - 1]++;
    if (!zeroBets[index - 1]) {
      zeroBets[index - 1] = true;
    }
    totalBetAmount.value += betValue;
  }

  void activeBet(int index) {
    if (totalBetAmount.value + betValue > userBalance.value) {
      print("Not enough money");
      return;
    }
    betsOnBoardCount[index - 1]++;
    if (!betsOnBoard[index - 1]) {
      betsOnBoard[index - 1] = true;
    }
    totalBetAmount.value += betValue;
  }

  void activeCornerBet(int index) {
    if (totalBetAmount.value + betValue * 4 > userBalance.value) {
      print("Not enough money");
      return;
    }
    cornerBets[index - 1] = true;
    totalBetAmount.value += betValue * 4;
  }

  void activeVerticalSideBet(int index) {
    if (totalBetAmount.value + betValue * 3 > userBalance.value) {
      print("Not enough money");
      return;
    }
    verticalSideBets[index - 1] = true;
    totalBetAmount.value += betValue * 3;
  }

  void activeHorizontalSideBet(int index) {
    if (totalBetAmount.value + betValue * 2 > userBalance.value) {
      print("Not enough money");
      return;
    }
    horizontalSideBets[index - 1] = true;
    totalBetAmount.value += betValue * 2;
  }

  void activeStreetBet(int index) {
    if (totalBetAmount.value + betValue * 3 > userBalance.value) {
      print("Not enough money");
      return;
    }
    streetBets[index - 1] = true;
    totalBetAmount.value += betValue * 3;
  }

  void activeDoubleStreetBet(int index) {
    if (totalBetAmount.value + betValue * 6 > userBalance.value) {
      print("Not enough money");
      return;
    }
    streetBets[index - 1] = true;
    totalBetAmount.value += betValue * 6;
  }

  void activeZeroSideBet(int index) {
    if (totalBetAmount.value + betValue * 4 > userBalance.value) {
      print("Not enough money");
      return;
    }
    zeroSideBets[index - 1] = true;
    totalBetAmount.value += betValue * 4;
  }

  void activeFirst12() {
    if (totalBetAmount.value + (betValue * 12) > userBalance.value) {
      print("Not enough money");
      return;
    }
    for (var i = 0; i < 12; i++) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 12;
  }

  void activeSecond12() {
    if (totalBetAmount.value + (betValue * 12) > userBalance.value) {
      print("Not enough money");
      return;
    }
    for (var i = 12; i < 24; i++) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 12;
  }

  void activeThird12() {
    if (totalBetAmount.value + (betValue * 12) > userBalance.value) {
      print("Not enough money");
      return;
    }
    for (var i = 24; i < 36; i++) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 12;
  }

  void activeFirstColumn() {
    if (totalBetAmount.value + (betValue * 12) > userBalance.value) {
      print("Not enough money");
      return;
    }
    for (var i = 0; i < 36; i += 3) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 12;
  }

  void activeSecondColumn() {
    if (totalBetAmount.value + (betValue * 12) > userBalance.value) {
      print("Not enough money");
      return;
    }
    for (var i = 1; i < 36; i += 3) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 12;
  }

  void activeThirdColumn() {
    if (totalBetAmount.value + (betValue * 12) > userBalance.value) {
      print("Not enough money");
      return;
    }
    for (var i = 2; i < 36; i += 3) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 12;
  }

  void activeEven() {
    if (totalBetAmount.value + (betValue * 18) > userBalance.value) {
      print("Not enough money");
      return;
    }
    for (var i = 0; i < 36; i += 2) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 18;
  }

  void activeOdd() {
    if (totalBetAmount.value + (betValue * 18) > userBalance.value) {
      print("Not enough money");
      return;
    }
    for (var i = 1; i < 36; i += 2) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 18;
  }

  void active1to18() {
    if (totalBetAmount.value + (betValue * 18) > userBalance.value) {
      print("Not enough money");
      return;
    }
    for (var i = 0; i < 18; i++) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 18;
  }

  void active19to36() {
    if (totalBetAmount.value + (betValue * 18) > userBalance.value) {
      print("Not enough money");
      return;
    }
    for (var i = 18; i < 36; i++) {
      betsOnBoard[i] = true;
    }
    totalBetAmount += betValue * 18;
  }

  void activeRed() {
    if (totalBetAmount.value + (betValue * 18) > userBalance.value) {
      print("Not enough money");
      return;
    }
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
    if (totalBetAmount.value + (betValue * 18) > userBalance.value) {
      print("Not enough money");
      return;
    }
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

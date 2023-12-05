import 'package:get/get.dart';

class AdminController extends GetxController {
  var numberOfGamesPlayed = 0.obs;
  var numberOfGamesWon = 0.obs;
  var numberOfGamesLost = 0.obs;

  void calculateNumberOfGames(List<dynamic> games) {
    var countOfGames = List.empty(growable: true);
    numberOfGamesWon.value = 0;
    numberOfGamesLost.value = 0;
    numberOfGamesPlayed.value = 0;
    for (var i = 0; i < games.length; i++) {
      if (countOfGames.contains(games[i]['gameID']) == false) {
        countOfGames.add(games[i]['gameID']);
      }
      if (games[i]['last_bet_won_lost'] == 'Won') {
        numberOfGamesWon.value = numberOfGamesWon.value + 1;
      }
      if (games[i]['last_bet_won_lost'] == 'Lost') {
        numberOfGamesLost.value = numberOfGamesLost.value + 1;
      }
    }
    numberOfGamesPlayed.value = countOfGames.length;
  }
}

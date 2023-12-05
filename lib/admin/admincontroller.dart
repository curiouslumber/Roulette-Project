import 'package:get/get.dart';

class AdminController extends GetxController {
  var numberOfGamesPlayed = 0.obs;

  void calculateNumberOfGames(List<dynamic> games) {
    var countOfGames = List.empty(growable: true);
    for (var i = 0; i < games.length; i++) {
      if (countOfGames.contains(games[i]['gameID']) == false) {
        countOfGames.add(games[i]['gameID']);
      }
    }
    numberOfGamesPlayed.value = countOfGames.length;
  }
}

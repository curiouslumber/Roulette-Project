import 'package:flutter/material.dart';
import 'package:roulette_project/enums/o_cell_type.dart';
import 'package:roulette_project/models/BetModel.dart';

class TableSelectProvider extends ChangeNotifier {
  List<BetModel> bets = [];

  reset() {
    bets = [];
    notifyListeners();
  }

  getBet(OCellType cellType, dynamic data) {
    return bets
        .where(
            (element) => element.cellType == cellType && element.data == data)
        .toList();
  }

  setBet(OCellType cellType, dynamic data, int betVal) {
    List<BetModel> existing = getBet(cellType, data);
    if (existing.isNotEmpty) {
      bets.remove(existing[0]);
      notifyListeners();
      return;
    }
    bets.add(BetModel(cellType: cellType, betVal: betVal, data: data));
    notifyListeners();
  }

  bool getBetByValue(String value) {
    return getCalculatedValues().any((element) => element == value);
  }

  bool hasBet() {
    return bets.isNotEmpty;
  }

  List<String> getCalculatedValues() {
    List<String> values = [];
    insert(String value) {
      if (values.contains(value)) {
        return;
      }
      values.add(value);
    }

    for (var bet in bets) {
      if (bet.cellType == OCellType.middle) {
        insert("${bet.data}");
      }
      if (bet.cellType == OCellType.part) {
        for (int i = bet.data[0]; i <= bet.data[1]; i++) {
          insert("$i");
        }
      }
      if (bet.cellType == OCellType.even) {
        for (int i = 0; i <= 36; i++) {
          if ((i % 2) == 0) {
            insert("$i");
          }
        }
      }
      if (bet.cellType == OCellType.odd) {
        for (int i = 0; i <= 36; i++) {
          if ((i % 2) != 0) {
            insert("$i");
          }
        }
      }
      if (bet.cellType == OCellType.corner) {
        for (var element in (bet.data as List<int>)) {
          insert('$element');
        }
      }
    }
    return values;
  }
}

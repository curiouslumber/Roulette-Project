// ignore: file_names
import 'package:roulette_project/enums/o_cell_type.dart';

class BetModel {
  OCellType cellType;
  dynamic data;
  int betVal;

  BetModel({required this.cellType, required this.betVal, this.data});
}

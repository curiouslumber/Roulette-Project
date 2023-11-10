import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roulette_project/enums/r_cell_type.dart';
import 'package:roulette_project/providers/table_select_provider.dart';

class RCell extends StatelessWidget {
  final String cellEntry;
  final RCellType cellType;
  const RCell(this.cellEntry, this.cellType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(child: cell()),
        Consumer<TableSelectProvider>(
          builder: (context, value, child) {
            bool existing = value.getBetByValue(cellEntry);
            return (existing)
                ? Positioned.fill(
                    child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(125, 200, 200, 200)),
                  ))
                : const Text("");
          },
        )
      ],
    );
  }

  cell() {
    switch (cellType) {
      case RCellType.black:
        return blackCell();
      case RCellType.red:
        return redCell();
      case RCellType.flat:
        return flatCell();
      case RCellType.flatRotate:
        return flatCellRotated();
      case RCellType.diamondRed:
        return diamondRed();
      case RCellType.diamondBlack:
        return diamondBlack();
    }
  }

  blackCell() {
    return Container(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 10, bottom: 10),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
      child: Center(
        child: Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.black,
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              cellEntry,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  redCell() {
    return Container(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 10, bottom: 10),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
      child: Center(
        child: Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Color.fromARGB(255, 184, 27, 27),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              cellEntry,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  flatCellRotated() {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
      child: Center(
        child: Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              cellEntry,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  flatCell() {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
      child: Center(
        child: Container(
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: RotatedBox(
            quarterTurns: 0,
            child: Text(
              cellEntry,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  diamondRed() {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
      child: Center(
        child: Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 184, 27, 27),
          ),
          child: Text(
            cellEntry,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  diamondBlack() {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
      child: Center(
        child: Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Text(
            cellEntry,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

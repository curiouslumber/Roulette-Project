import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roulette_project/enums/o_cell_type.dart';
import 'package:roulette_project/providers/table_select_provider.dart';

// ignore: must_be_immutable
class OCell extends StatelessWidget {
  double? l;
  double? t;
  double? b;
  double? r;
  double w;
  double h;
  OCellType oct;
  // ignore: prefer_typing_uninitialized_variables
  var data;
  OCell(
      {super.key,
      required this.oct,
      this.data,
      this.l,
      this.t,
      this.b,
      this.r,
      this.w = 20,
      this.h = 20});
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: t,
        left: l,
        child: InkWell(
          mouseCursor: SystemMouseCursors.click,
          child: Container(
            width: w,
            height: h,
            decoration:
                const BoxDecoration(color: Color.fromARGB(0, 255, 235, 59)),
            child: const Text(""),
          ),
          onTap: () {
            Provider.of<TableSelectProvider>(context, listen: false)
                .setBet(oct, data, 10);
          },
        ));
  }
}

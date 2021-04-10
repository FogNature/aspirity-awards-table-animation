import 'package:aspirity_awards_table_anim/widgets/table_cell.dart';
import 'package:flutter/material.dart';

class TextTableCell extends StatelessWidget {
  final String content;
  final double cellWidth;
  final bool isIdCell;

  TextTableCell({
    Key key,
    this.content,
    this.isIdCell = false, this.cellWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspirityTableCell(
      cellWidth: cellWidth,
      child: Text(
        content,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isIdCell ? FontWeight.w700 : FontWeight.w400,
          color: Color(0xff333333),
        ),
      ),
    );
  }
}

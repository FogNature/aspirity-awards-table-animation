import 'package:aspirity_awards_table_anim/model/cell_button_data.dart';
import 'package:aspirity_awards_table_anim/widgets/table_cell.dart';
import 'package:flutter/material.dart';

class TextButtonTableCell extends StatelessWidget {
  final CellButtonData<String> content;
  final double cellWidth;

  TextButtonTableCell({
    Key key,
    this.content,
    this.cellWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspirityTableCell(
      cellWidth: cellWidth,
      child: InkWell(
        onTap: content.onPressed,
        child: Center(
          child: Text(
            content.data,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff037770),
            ),
          ),
        ),
      ),
    );
  }
}

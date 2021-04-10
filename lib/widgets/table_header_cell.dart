import 'package:flutter/material.dart';

class TableHeaderCell extends StatelessWidget {
  final String title;
  final double cellWidth;

  const TableHeaderCell({Key key, this.title, this.cellWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cellWidth,
      color: Color(0xfff3f3f3),
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xff7a7a7a),
        ),
      ),
    );
  }
}

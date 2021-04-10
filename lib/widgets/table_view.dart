import 'package:aspirity_awards_table_anim/model/table_data.dart';
import 'package:aspirity_awards_table_anim/widgets/table_header_cell.dart';
import 'package:aspirity_awards_table_anim/widgets/table_row.dart';
import 'package:flutter/material.dart';

class TableView extends StatelessWidget {
  final TableData data;

  const TableView({
    Key key,
    this.data,
  }) : super(key: key);

  Widget _buildHeaderRow() {
    return Row(
      children: data.columns
          .map<Widget>((e) => TableHeaderCell(
                title: e.keys.first,
                cellWidth: e.values.first,
              ))
          .toList(),
    );
  }

  List<Widget> _buildRows() {
    final cellWidth = data.columns.map((e) => e.values.first).toList();
    return data.data
        .asMap()
        .map(
          (index, element) => MapEntry(
            index,
            AspirityTableRow(
              data: element,
              cellWidth: cellWidth,
              position: index,
            ),
          ),
        )
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Color(0xff037770),
                  ),
                ),
              ),
              child: Column(
                //defaultColumnWidth: FixedColumnWidth(64),
                children: [
                  _buildHeaderRow(),
                  ..._buildRows(),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.white,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

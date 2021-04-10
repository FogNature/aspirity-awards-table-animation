import 'package:aspirity_awards_table_anim/model/cell_data.dart';
import 'package:aspirity_awards_table_anim/model/table_data.dart';
import 'package:aspirity_awards_table_anim/utils/cell_types.dart';
import 'package:aspirity_awards_table_anim/widgets/table_view.dart';
import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  TableData data;

  @override
  void initState() {
    super.initState();
    List<List<CellData>> rows = [];
    for (int i = 0; i < 13; i++) {
      final row = [
        CellData('${2021 - i}', CellType.id),
      ];
      for (int j = 0; j < 13; j++) {
        row.add(
          CellData(
            '0,29%',
            CellType.text,
          ),
        );
      }
      rows.add(row);
    }
    data = TableData(columns: [
      {
        'Year': 64,
      },
      {
        'Jan': 64,
      },
      {
        'Feb': 64,
      },
      {
        'Mar': 64,
      },
      {
        'Apr': 64,
      },
      {
        'May': 64,
      },
      {
        'Jun': 64,
      },
      {
        'Jul': 64,
      },
      {
        'Aug': 64,
      },
      {
        'Sep': 64,
      },
      {
        'Oct': 64,
      },
      {
        'Nov': 64,
      },
      {
        'Dec': 64,
      },
      {
        'YTD': 64,
      },
      {
        '': 100,
      }
    ], data: rows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scrollbar(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 80,
                left: 40,
                bottom: 36,
                right: 40,
              ),
              child: Text(
                'Monthly return',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                ),
              ),
            ),
            TableView(
              data: data,
            ),
          ],
        ),
      ),
    );
  }
}

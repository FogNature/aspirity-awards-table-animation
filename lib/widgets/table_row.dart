import 'package:aspirity_awards_table_anim/model/cell_button_data.dart';
import 'package:aspirity_awards_table_anim/model/cell_data.dart';
import 'package:aspirity_awards_table_anim/utils/cell_types.dart';
import 'package:aspirity_awards_table_anim/widgets/row_content.dart';
import 'package:aspirity_awards_table_anim/widgets/text_button_table_cell.dart';
import 'package:aspirity_awards_table_anim/widgets/text_table_cell.dart';
import 'package:flutter/material.dart';

class AspirityTableRow extends StatefulWidget {
  final int position;
  final List<double> cellWidth;
  final List<CellData> data;

  const AspirityTableRow({Key key, this.position, this.cellWidth, this.data})
      : super(key: key);

  @override
  State<AspirityTableRow> createState() => _AspirityTableRowState();
}

class _AspirityTableRowState extends State<AspirityTableRow>
    with SingleTickerProviderStateMixin {
  Animation<double> _heightAnimation;
  Animation<double> _opacityAnimation;
  Animation<Color> _shadowColorAnimation;
  Animation<Color> _colorAnimation;
  Animation<double> _blurRadiusAnimation;
  AnimationController _controller;
  bool _isOpened = false;
  double rowWidth;

  Widget _buildTableCell(CellType type, dynamic content, double cellWidth) {
    switch (type) {
      case CellType.id:
        return TextTableCell(
          cellWidth: cellWidth,
          content: content,
          isIdCell: true,
        );
      case CellType.text:
        return TextTableCell(
          cellWidth: cellWidth,
          content: content,
        );
      case CellType.image:
        return TextTableCell(
          cellWidth: cellWidth,
          content: 'image',
        );
      default:
        throw UnimplementedError();
    }
  }

  @override
  void initState() {
    super.initState();
    rowWidth = 0;
    widget.cellWidth.forEach((element) {
      rowWidth += element;
    });
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      reverseDuration: Duration(
        milliseconds: 500,
      ),
    )..addListener(() {
      setState(() {});
    });
    _heightAnimation = Tween<double>(
      begin: 0,
      end: 136,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.33, 0.67, curve: Curves.ease),
    ))..addStatusListener((status) {
        if (status == AnimationStatus.forward || status == AnimationStatus.dismissed) {
          setState(() {
            _isOpened = !_isOpened;
          });
        }
      });
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.67, 1, curve: Curves.ease),
    ));
    _shadowColorAnimation = ColorTween(begin: Colors.transparent, end: Colors.black12).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0, 0.33, curve: Curves.ease),
        )
    );
    _colorAnimation = ColorTween(begin: Color(0xff037770).withOpacity(0.03), end: Color(0xff037770).withOpacity(0)).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0, 0.33, curve: Curves.ease),
        )
    );
    _blurRadiusAnimation = Tween<double>(begin: 0, end: 12).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0, 0.33, curve: Curves.ease),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64 + _heightAnimation.value,
      width: rowWidth,
      decoration: BoxDecoration(
        color: _controller.status != AnimationStatus.dismissed ? Colors.white : Colors.transparent,
        border: Border(
          top: BorderSide(
            color: Color(0xffeeeeee),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: _blurRadiusAnimation.value,
            color: _shadowColorAnimation.value
          )
        ]
      ),
      child: Container(
        color: widget.position % 2 == 0
            ? Colors.transparent
            : _colorAnimation.value,
        child: Column(
          children: [
            SizedBox(
              height: 63,
              child: Row(
                children: [
                  ...widget.data
                      .asMap()
                      .map<int, Widget>(
                        (index, value) => MapEntry(
                          index,
                          _buildTableCell(
                            value.type,
                            value.data,
                            widget.cellWidth[index],
                          ),
                        ),
                      )
                      .values
                      .toList(),
                  TextButtonTableCell(
                    cellWidth: widget.cellWidth.last,
                    content: CellButtonData(
                        data: 'Details',
                        onPressed: () {
                          if (_isOpened) {
                            _controller.reverse();
                          } else {
                            _controller.forward();
                          }
                        }),
                  )
                ],
              ),
            ),
            Visibility(
              visible: _isOpened,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: RowContent(onCompleted: () {
                  Future.delayed(Duration(milliseconds: 500), () => _controller.reverse());
                },),
              ),
            )
          ],
        ),
      ),
    );
  }
}

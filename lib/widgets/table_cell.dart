import 'package:flutter/material.dart';

class AspirityTableCell extends StatelessWidget {
  final Widget child;
  final double cellWidth;

  const AspirityTableCell({
    Key key,
    @required this.child, this.cellWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cellWidth,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: child,
    );
  }
}

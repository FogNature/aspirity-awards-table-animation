import 'package:flutter/foundation.dart';

class CellButtonData<T> {
  final T data;
  final VoidCallback onPressed;

  CellButtonData({this.data, this.onPressed,});
}
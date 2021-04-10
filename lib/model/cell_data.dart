import 'package:aspirity_awards_table_anim/utils/cell_types.dart';

class CellData<T> {
  final T data;
  final CellType type;

  CellData(
    this.data,
    this.type,
  );
}

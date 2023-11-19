import 'package:equatable/equatable.dart';

class Matrix extends Equatable {
  final int row;
  final int column;
  const Matrix(this.row, this.column);

  int get rowSumColumn => row + column;

  List<int> get matrix => [row, column];

  bool isEqual(Matrix matrix) => row == matrix.row && column == matrix.column;

  @override
  List<Object?> get props => [row, column];

  @override
  toString() => '$row $column';
}

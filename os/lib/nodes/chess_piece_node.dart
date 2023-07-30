import 'package:chess_os/utils/chess_pieces.dart';

import '../model/chess_matrix.dart';

abstract class ChessPieceNode {
  String? piece;
  late Matrix matrix;
  final bool isWhite;

  int get _row => matrix.row;
  int get _column => matrix.column;

  ChessPieceNode(this.isWhite, this.matrix);

  ChessPieceNode copyWith(Matrix matrix);

  List<Matrix> possibleMovements(List<Matrix> currentFilled);

  bool isBlocker(Matrix position);
}

class PawnNode extends ChessPieceNode {
  PawnNode(super.isWhite, super.matrix) {
    piece = isWhite ? ChessPieceAssets.pawnWhite : ChessPieceAssets.pawnBlack;
  }

  @override
  PawnNode copyWith(Matrix matrix) => PawnNode(isWhite, matrix);

  @override
  List<Matrix> possibleMovements(List<Matrix> currentFilled) {
    List<Matrix> matrixes = [];
    List<Matrix> crossCut = [];

    if (isWhite) {
      crossCut = currentFilled
          .where((element) =>
              element == Matrix(_row + 1, _column + 1) ||
              element == Matrix(_row - 1, _column + 1))
          .toList();
      if (currentFilled
          .any((element) => element == Matrix(matrix.row, matrix.column + 1))) {
        return [...crossCut];
      }
      if (matrix.column == 1) {
        matrixes.add(Matrix(matrix.row, matrix.column + 2));
      }
      matrixes.add(Matrix(matrix.row, matrix.column + 1));
    } else {
      crossCut = currentFilled
          .where((element) =>
              element == Matrix(_row + 1, _column - 1) ||
              element == Matrix(_row - 1, _column - 1))
          .toList();
      if (matrix.column == 6) {
        if (currentFilled.any(
            (element) => element == Matrix(matrix.row, matrix.column - 1))) {
          return [...crossCut];
        }
        matrixes.add(Matrix(matrix.row, matrix.column - 2));
      }
      matrixes.add(Matrix(matrix.row, matrix.column - 1));
    }

    return matrixes
      ..removeWhere((element) => currentFilled.contains(element))
      ..addAll(crossCut);
  }

  @override
  bool isBlocker(Matrix position) {
    return position is! EmptyNode;
  }
}

class EmptyNode extends ChessPieceNode {
  EmptyNode(Matrix matrix) : super(false, matrix);
  @override
  EmptyNode copyWith(Matrix matrix) {
    return EmptyNode(matrix);
  }

  @override
  List<Matrix> possibleMovements(List<Matrix> currentFilled) {
    return [];
  }

  @override
  bool isBlocker(Matrix position) {
    return false;
  }
}

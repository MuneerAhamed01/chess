import 'package:chess_os/utils/chess_pieces.dart';

import '../model/chess_matrix.dart';

/// [possibleMovements]
/// -- The movements can move for the [ChessPieceNode] node
/// -- need to calculate the blocked movement of the piece
/// -- any special movement

abstract class ChessPieceNode {
  String? piece;
  late Matrix matrix;
  final bool isWhite;

  int get _row => matrix.row;
  int get _column => matrix.column;

  ChessPieceNode(this.isWhite, this.matrix);

  ChessPieceNode copyWith(Matrix matrix);

  List<Matrix> possibleMovements(List<Matrix> currentFilled) {
    if (isWhite) {
      return _movementsForWhite(currentFilled);
    } else {
      return _movementsForBlack(currentFilled);
    }
  }

  List<Matrix> _movementsForWhite(List<Matrix> currentFilled);

  List<Matrix> _movementsForBlack(List<Matrix> currentFilled);

  bool isBlocker(Matrix position);
}

class PawnNode extends ChessPieceNode {
  PawnNode(super.isWhite, super.matrix) {
    piece = isWhite ? ChessPieceAssets.pawnWhite : ChessPieceAssets.pawnBlack;
  }

  @override
  PawnNode copyWith(Matrix matrix) => PawnNode(isWhite, matrix);

  @override
  bool isBlocker(Matrix position) {
    return position is! EmptyNode;
  }

  @override
  List<Matrix> _movementsForWhite(List<Matrix> currentFilled) {
    List<Matrix> matrixes = [];
    List<Matrix> crossCut = [];
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

    return matrixes
      ..removeWhere((element) => currentFilled.contains(element))
      ..addAll(crossCut);
  }

  @override
  List<Matrix> _movementsForBlack(List<Matrix> currentFilled) {
    List<Matrix> matrixes = [];
    List<Matrix> crossCut = [];
    crossCut = currentFilled
        .where((element) =>
            element == Matrix(_row + 1, _column - 1) ||
            element == Matrix(_row - 1, _column - 1))
        .toList();
    if (matrix.column == 6) {
      if (currentFilled
          .any((element) => element == Matrix(matrix.row, matrix.column - 1))) {
        return [...crossCut];
      }
      matrixes.add(Matrix(matrix.row, matrix.column - 2));
    }
    matrixes.add(Matrix(matrix.row, matrix.column - 1));
    return matrixes
      ..removeWhere((element) => currentFilled.contains(element))
      ..addAll(crossCut);
  }
}

class RookNode extends ChessPieceNode {
  RookNode(super.isWhite, super.matrix) {
    piece = isWhite ? ChessPieceAssets.rookWhite : ChessPieceAssets.rookBlack;
  }

  @override
  ChessPieceNode copyWith(Matrix matrix) => RookNode(isWhite, matrix);

  @override
  bool isBlocker(Matrix position) {
    return position is! EmptyNode;
  }

  List<Matrix> _commonMovement(List<Matrix> currentFilled) {
    final moveMatrix = <Matrix>[];
    final elementsInRow =
        currentFilled.where((element) => element.row == _row).toList();
    final elementsInColumn =
        currentFilled.where((element) => element.column == _column).toList();

    for (int i = _column - 1; i >= 0; i--) {
      if (elementsInRow.any((element) => element.column == i)) {
        moveMatrix.add(Matrix(_row, i));
        break;
      }
      moveMatrix.add(Matrix(_row, i));
    }

    for (int i = _column + 1; i <= 7; i++) {
      if (elementsInRow.any((element) => element.column == i)) {
        moveMatrix.add(Matrix(_row, i));
        break;
      }
      moveMatrix.add(Matrix(_row, i));
    }

    for (int i = _row - 1; i >= 0; i--) {
      if (elementsInColumn.any((element) => element.row == i)) {
        moveMatrix.add(Matrix(i, _column));
        break;
      }
      moveMatrix.add(Matrix(i, _column));
    }

    for (int i = _row + 1; i <= 7; i++) {
      if (elementsInColumn.any((element) => element.row == i)) {
        moveMatrix.add(Matrix(i, _column));
        break;
      }
      moveMatrix.add(Matrix(i, _column));
    }

    return moveMatrix;
  }

  @override
  List<Matrix> _movementsForWhite(List<Matrix> currentFilled) =>
      _commonMovement(currentFilled);

  @override
  List<Matrix> _movementsForBlack(List<Matrix> currentFilled) =>
      _commonMovement(currentFilled);
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

  @override
  List<Matrix> _movementsForBlack(List<Matrix> currentFilled) {
    throw UnimplementedError();
  }

  @override
  List<Matrix> _movementsForWhite(List<Matrix> currentFilled) {
    throw UnimplementedError();
  }
}

class HorseNode extends ChessPieceNode {
  HorseNode(super.isWhite, super.matrix) {
    piece = isWhite ? ChessPieceAssets.horseWhite : ChessPieceAssets.horseBlack;
  }
  @override
  HorseNode copyWith(Matrix matrix) {
    return HorseNode(isWhite, matrix);
  }

  @override
  List<Matrix> possibleMovements(List<Matrix> currentFilled) {
    List<Matrix> movement = [];
    movement.add(Matrix(_row + 1, _column + 2));
    movement.add(Matrix(_row - 1, _column + 2));
    movement.add(Matrix(_row + 2, _column + 1));
    movement.add(Matrix(_row - 2, _column + 1));
    movement.add(Matrix(_row + 2, _column - 1));
    movement.add(Matrix(_row - 2, _column - 1));
    movement.add(Matrix(_row - 1, _column - 2));
    movement.add(Matrix(_row + 1, _column - 2));

    return movement;
  }

  @override
  bool isBlocker(Matrix position) {
    return false;
  }

  @override
  List<Matrix> _movementsForBlack(List<Matrix> currentFilled) {
    throw UnimplementedError();
  }

  @override
  List<Matrix> _movementsForWhite(List<Matrix> currentFilled) {
    throw UnimplementedError();
  }
}

class BishopNode extends ChessPieceNode {
  BishopNode(bool isWhite, Matrix matrix) : super(isWhite, matrix) {
    piece =
        isWhite ? ChessPieceAssets.bishopWhite : ChessPieceAssets.bishopBlack;
  }

  @override
  ChessPieceNode copyWith(Matrix matrix) => BishopNode(isWhite, matrix);

  @override
  bool isBlocker(Matrix position) {
    return position is! EmptyNode;
  }

  List<Matrix> _commonMovement(List<Matrix> currentFilled) {
    final moveMatrix = <Matrix>[];

    // Diagonal movements
    for (int i = 1; i <= 7; i++) {
      if (_row - i >= 0 && _column - i >= 0) {
        moveMatrix.add(Matrix(_row - i, _column - i));
        if (currentFilled.any((element) =>
            element.row == _row - i && element.column == _column - i)) {
          break;
        }
      } else {
        break;
      }
    }

    for (int i = 1; i <= 7; i++) {
      if (_row - i >= 0 && _column + i <= 7) {
        moveMatrix.add(Matrix(_row - i, _column + i));
        if (currentFilled.any((element) =>
            element.row == _row - i && element.column == _column + i)) {
          break;
        }
      } else {
        break;
      }
    }

    for (int i = 1; i <= 7; i++) {
      if (_row + i <= 7 && _column - i >= 0) {
        moveMatrix.add(Matrix(_row + i, _column - i));
        if (currentFilled.any((element) =>
            element.row == _row + i && element.column == _column - i)) {
          break;
        }
      } else {
        break;
      }
    }

    for (int i = 1; i <= 7; i++) {
      if (_row + i <= 7 && _column + i <= 7) {
        moveMatrix.add(Matrix(_row + i, _column + i));
        if (currentFilled.any((element) =>
            element.row == _row + i && element.column == _column + i)) {
          break;
        }
      } else {
        break;
      }
    }

    return moveMatrix;
  }

  @override
  List<Matrix> _movementsForWhite(List<Matrix> currentFilled) =>
      _commonMovement(currentFilled);

  @override
  List<Matrix> _movementsForBlack(List<Matrix> currentFilled) =>
      _commonMovement(currentFilled);
}

class QueenNode extends ChessPieceNode {
  QueenNode(bool isWhite, Matrix matrix) : super(isWhite, matrix) {
    piece = isWhite ? ChessPieceAssets.queenWhite : ChessPieceAssets.queenBlack;
  }

  @override
  ChessPieceNode copyWith(Matrix matrix) => QueenNode(isWhite, matrix);

  @override
  bool isBlocker(Matrix position) {
    return position is! EmptyNode;
  }

  List<Matrix> _commonMovement(List<Matrix> currentFilled) {
    final moveMatrix = <Matrix>[];

    // Rook-like movements
    for (int i = _column - 1; i >= 0; i--) {
      if (currentFilled
          .any((element) => element.row == _row && element.column == i)) {
        moveMatrix.add(Matrix(_row, i));
        break;
      }
      moveMatrix.add(Matrix(_row, i));
    }

    for (int i = _column + 1; i <= 7; i++) {
      if (currentFilled
          .any((element) => element.row == _row && element.column == i)) {
        moveMatrix.add(Matrix(_row, i));
        break;
      }
      moveMatrix.add(Matrix(_row, i));
    }

    for (int i = _row - 1; i >= 0; i--) {
      if (currentFilled
          .any((element) => element.row == i && element.column == _column)) {
        moveMatrix.add(Matrix(i, _column));
        break;
      }
      moveMatrix.add(Matrix(i, _column));
    }

    for (int i = _row + 1; i <= 7; i++) {
      if (currentFilled
          .any((element) => element.row == i && element.column == _column)) {
        moveMatrix.add(Matrix(i, _column));
        break;
      }
      moveMatrix.add(Matrix(i, _column));
    }

    // Bishop-like movements
    for (int i = 1; i <= 7; i++) {
      if (_row - i >= 0 && _column - i >= 0) {
        moveMatrix.add(Matrix(_row - i, _column - i));
        if (currentFilled.any((element) =>
            element.row == _row - i && element.column == _column - i)) {
          break;
        }
      } else {
        break;
      }
    }

    for (int i = 1; i <= 7; i++) {
      if (_row - i >= 0 && _column + i <= 7) {
        moveMatrix.add(Matrix(_row - i, _column + i));
        if (currentFilled.any((element) =>
            element.row == _row - i && element.column == _column + i)) {
          break;
        }
      } else {
        break;
      }
    }

    for (int i = 1; i <= 7; i++) {
      if (_row + i <= 7 && _column - i >= 0) {
        moveMatrix.add(Matrix(_row + i, _column - i));
        if (currentFilled.any((element) =>
            element.row == _row + i && element.column == _column - i)) {
          break;
        }
      } else {
        break;
      }
    }

    for (int i = 1; i <= 7; i++) {
      if (_row + i <= 7 && _column + i <= 7) {
        moveMatrix.add(Matrix(_row + i, _column + i));
        if (currentFilled.any((element) =>
            element.row == _row + i && element.column == _column + i)) {
          break;
        }
      } else {
        break;
      }
    }

    return moveMatrix;
  }

  @override
  List<Matrix> _movementsForWhite(List<Matrix> currentFilled) =>
      _commonMovement(currentFilled);

  @override
  List<Matrix> _movementsForBlack(List<Matrix> currentFilled) =>
      _commonMovement(currentFilled);
}

class KingNode extends ChessPieceNode {
  KingNode(bool isWhite, Matrix matrix) : super(isWhite, matrix) {
    piece = isWhite ? ChessPieceAssets.kingWhite : ChessPieceAssets.kingBlack;
  }

  @override
  ChessPieceNode copyWith(Matrix matrix) => KingNode(isWhite, matrix);

  @override
  bool isBlocker(Matrix position) {
    return position is! EmptyNode;
  }

  List<Matrix> _commonMovement() {
    final moveMatrix = <Matrix>[];

    // Movements in all directions
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) {
          continue; // Skip the current position
        }

        final newRow = _row + i;
        final newColumn = _column + j;

        if (newRow >= 0 && newRow <= 7 && newColumn >= 0 && newColumn <= 7) {
          moveMatrix.add(Matrix(newRow, newColumn));
        }
      }
    }

    return moveMatrix;
  }

  @override
  List<Matrix> _movementsForWhite(List<Matrix> currentFilled) =>
      _commonMovement();

  @override
  List<Matrix> _movementsForBlack(List<Matrix> currentFilled) =>
      _commonMovement();
}

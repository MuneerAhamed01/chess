import 'package:chess_os/utils/chess_pieces.dart';

import '../model/chess_matrix.dart';

abstract class ChessPieceNode {
  String? piece;
  late Matrix matrix;
  final bool isWhite;

  ChessPieceNode(this.isWhite, this.matrix);

  ChessPieceNode copyWith(Matrix matrix);

  List<Matrix> possibleMovements();
}

class PawnNode extends ChessPieceNode {
  PawnNode(super.isWhite, super.matrix) {
    piece = isWhite ? ChessPieceAssets.pawnWhite : ChessPieceAssets.pawnBlack;
  }

  @override
  PawnNode copyWith(Matrix matrix) {
    return PawnNode(isWhite, matrix);
  }

  @override
  List<Matrix> possibleMovements() {
    return [const Matrix(0, 4)];
  }
}

class EmptyNode extends ChessPieceNode {
  EmptyNode(Matrix matrix) : super(false, matrix);
  @override
  EmptyNode copyWith(Matrix matrix) {
    return EmptyNode(matrix);
  }

  @override
  List<Matrix> possibleMovements() {
    return [];
  }
}

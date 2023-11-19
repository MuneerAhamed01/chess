import 'package:chess_os/model/chess_matrix.dart';

import '../../nodes/chess_piece_node.dart';

class ChessServices {
  ChessServices._();
  static final ChessServices instance = ChessServices._();

  Map<Matrix, ChessPieceNode> piecePosition() {
    return {
      const Matrix(0, 0): RookNode(true, const Matrix(0, 0)),
      const Matrix(1, 0): HorseNode(true, const Matrix(1, 0)),
      const Matrix(2, 0): BishopNode(true, const Matrix(2, 0)),
      const Matrix(3, 0): QueenNode(true, const Matrix(3, 0)),
      const Matrix(4, 0): KingNode(true, const Matrix(4, 0)),
      const Matrix(5, 0): BishopNode(true, const Matrix(5, 0)),
      const Matrix(6, 0): HorseNode(true, const Matrix(6, 0)),
      const Matrix(7, 0): RookNode(true, const Matrix(7, 0)),
      const Matrix(0, 7): RookNode(false, const Matrix(0, 7)),
      const Matrix(1, 7): HorseNode(false, const Matrix(1, 7)),
      const Matrix(2, 7): BishopNode(false, const Matrix(2, 7)),
      const Matrix(3, 7): QueenNode(false, const Matrix(3, 7)),
      const Matrix(4, 7): KingNode(false, const Matrix(4, 7)),
      const Matrix(5, 7): BishopNode(false, const Matrix(5, 7)),
      const Matrix(6, 7): HorseNode(false, const Matrix(6, 7)),
      const Matrix(7, 7): RookNode(false, const Matrix(7, 7))
    };
  }
}

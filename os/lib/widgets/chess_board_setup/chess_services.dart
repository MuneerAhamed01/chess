import 'package:chess_os/model/chess_matrix.dart';
import 'package:chess_os/utils/chess_pieces.dart';

class ChessServices {
  ChessServices._();
  static final ChessServices instance = ChessServices._();

  Map<Matrix, String> piecePosition() {
    return {
      const Matrix(0, 0): ChessPieceAssets.rookWhite,
      const Matrix(1, 0): ChessPieceAssets.horseWhite,
      const Matrix(2, 0): ChessPieceAssets.bishopWhite,
      const Matrix(3, 0): ChessPieceAssets.queenWhite,
      const Matrix(4, 0): ChessPieceAssets.kingWhite,
      const Matrix(5, 0): ChessPieceAssets.bishopWhite,
      const Matrix(6, 0): ChessPieceAssets.horseWhite,
      const Matrix(7, 0): ChessPieceAssets.rookWhite,
      const Matrix(0, 7): ChessPieceAssets.rookBlack,
      const Matrix(1, 7): ChessPieceAssets.horseBlack,
      const Matrix(2, 7): ChessPieceAssets.bishopBlack,
      const Matrix(3, 7): ChessPieceAssets.queenBlack,
      const Matrix(4, 7): ChessPieceAssets.kingBlack,
      const Matrix(5, 7): ChessPieceAssets.bishopBlack,
      const Matrix(6, 7): ChessPieceAssets.horseBlack,
      const Matrix(7, 7): ChessPieceAssets.rookBlack
    };
  }
}

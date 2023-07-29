import 'package:chess_os/model/chess_matrix.dart';
import 'package:chess_os/utils/chess_pieces.dart';

class ChessServices {
  ChessServices._();
  static final ChessServices instance = ChessServices._();

  Map<Matrix, String> piecePosition() {
    return {
      Matrix(0, 0): ChessPieceAssets.rookWhite,
      Matrix(1, 0): ChessPieceAssets.horseWhite,
      Matrix(2, 0): ChessPieceAssets.bishopWhite,
      Matrix(3, 0): ChessPieceAssets.queenWhite,
      Matrix(4, 0): ChessPieceAssets.kingWhite,
      Matrix(5, 0): ChessPieceAssets.bishopWhite,
      Matrix(6, 0): ChessPieceAssets.horseWhite,
      Matrix(7, 0): ChessPieceAssets.rookWhite,
      Matrix(0, 7): ChessPieceAssets.rookBlack,
      Matrix(1, 7): ChessPieceAssets.horseBlack,
      Matrix(2, 7): ChessPieceAssets.bishopBlack,
      Matrix(3, 7): ChessPieceAssets.queenBlack,
      Matrix(4, 7): ChessPieceAssets.kingBlack,
      Matrix(5, 7): ChessPieceAssets.bishopBlack,
      Matrix(6, 7): ChessPieceAssets.horseBlack,
      Matrix(7, 7): ChessPieceAssets.rookBlack
    };
  }
}

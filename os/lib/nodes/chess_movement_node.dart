import 'package:chess_os/nodes/chess_piece_node.dart';
import 'package:flutter/foundation.dart';

class ChessController extends ChangeNotifier {
  ChessController._();
  static final ChessController instance = ChessController._();

  ChessPieceNode? _pickedPosition;
  ChessPieceNode? _droppedPosition;

  ChessPieceNode? get pickedValue => _pickedPosition;
  ChessPieceNode? get droppedValue => _droppedPosition;

  set pickValue(ChessPieceNode piece) {
    _pickedPosition = piece;
  }

  set dropValue(ChessPieceNode piece) {
    if (piece.matrix == _pickedPosition?.matrix) {
      _clear();
      return;
    }
    bool isPossibleToMove =
        _pickedPosition!.possibleMovements().contains(piece.matrix);
    if (isPossibleToMove) {
      _droppedPosition = piece;
      notifyListeners();
      _clear();
    }
  }

  _clear() {
    _pickedPosition = null;
    _droppedPosition = null;
  }
}

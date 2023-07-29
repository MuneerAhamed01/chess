import 'package:chess_os/model/chess_picker.dart';
import 'package:flutter/foundation.dart';

class ChessController extends ChangeNotifier {
  ChessController._();
  static final ChessController instance = ChessController._();

  ChessPicker? _pickedPosition;
  ChessPicker? _droppedPosition;

  ChessPicker? get pickedValue => _pickedPosition;
  ChessPicker? get droppedValue => _droppedPosition;

  set pickValue(ChessPicker piece) {
    _pickedPosition = piece;
  }

  set dropValue(ChessPicker piece) {
    if (piece.matrix == _pickedPosition?.matrix) {
      _clear();
      return;
    }
    _droppedPosition = piece;
    notifyListeners();
    _clear();
  }

  _clear() {
    _pickedPosition = null;
    _droppedPosition = null;
  }
}

import 'package:chess_os/model/chess_picker.dart';
import 'package:flutter/foundation.dart';

class ChessMovementNode extends ChangeNotifier {
  ChessMovementNode._();
  static final ChessMovementNode instance = ChessMovementNode._();

  ChessPicker? _pickedPosition;
  ChessPicker? _droppedPosition;

  ChessPicker? get pickedValue => _pickedPosition;
  ChessPicker? get droppedValue => _droppedPosition;

  set pickValue(ChessPicker piece) {
    _pickedPosition = piece;
  }

  set dropValue(ChessPicker piece) {
    _droppedPosition = piece;
    notifyListeners();
    _pickedPosition = null;
    _droppedPosition = null;
  }
}

import 'dart:async';

import 'package:chess_os/model/chess_matrix.dart';
import 'package:chess_os/nodes/chess_piece_node.dart';
import 'package:flutter/foundation.dart';

class ChessController extends ChangeNotifier {
  ChessController._() {
    _filledPositions = [
      for (int i = 0; i < 8; i++) ...[
        Matrix(i, 0),
        Matrix(i, 1),
        Matrix(i, 7),
        Matrix(i, 6)
      ],
    ];
  }
  static final ChessController instance = ChessController._();
  late final List<Matrix> _filledPositions;

  ChessPieceNode? _pickedPosition;
  ChessPieceNode? _droppedPosition;

  ChessPieceNode? get pickedValue => _pickedPosition;
  ChessPieceNode? get droppedValue => _droppedPosition;

  final StreamController<List<Matrix>> highlight =
      StreamController<List<Matrix>>.broadcast();

  set pickValue(ChessPieceNode piece) {
    print("Picked Piece ${piece.matrix}");
    _pickedPosition = piece;
    final possible = piece.possibleMovements(_filledPositions);
    highlight.sink.add(possible);
  }

  set dropValue(ChessPieceNode piece) {
    if (piece.matrix == _pickedPosition?.matrix) {
      print("Clearing Because it Touch the current Position ${piece.matrix}");
      _clear();
      return;
    }
    bool isPossibleToMove = _pickedPosition!
        .possibleMovements(_filledPositions)
        .contains(piece.matrix);

    if (isPossibleToMove) {
      if (piece is! EmptyNode) {
        bool shouldCut = _pickedPosition!.isWhite != piece.isWhite;
        if (shouldCut) _drop(piece);
      } else {
        _drop(piece);
      }
    }
  }

  _drop(ChessPieceNode piece) {
    print("Dropped Piece ${piece.matrix}");
    _droppedPosition = piece;
    notifyListeners();
    _updateTheFilledPosition(
      toRemove: _pickedPosition?.matrix,
      toAdd: _droppedPosition?.matrix,
    );
    _clear();
  }

  _clear() {
    _pickedPosition = null;
    _droppedPosition = null;
    highlight.sink.add([]);
  }

  _updateTheFilledPosition({Matrix? toRemove, Matrix? toAdd}) {
    if (toRemove != null) {
      _filledPositions.remove(toRemove);
    }
    if (toAdd != null && !_filledPositions.contains(toAdd)) {
      _filledPositions.add(toAdd);
    }
  }

  @override
  void dispose() {
    highlight.close();
    super.dispose();
  }
}

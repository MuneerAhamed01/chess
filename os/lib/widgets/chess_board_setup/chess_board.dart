import 'dart:math';

import 'package:chess_os/model/chess_matrix.dart';
import 'package:chess_os/nodes/chess_movement_node.dart';
import 'package:chess_os/nodes/chess_piece_node.dart';
import 'package:chess_os/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/colors.dart';
import 'chess_services.dart';

class FullBoard extends StatelessWidget {
  const FullBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemBuilder: _horizontalColumn,
          itemCount: 8,
        ),
      ),
    );
  }

  Widget _horizontalColumn(BuildContext context, int parentIndex) {
    final size = sizeOfColumn(context);
    return SizedBox(
      height: size,
      width: size,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return ChessColumn(
            matrix: Matrix(index, parentIndex),
          );
        },
        itemCount: 8,
      ),
    );
  }
}

class ChessColumn extends StatefulWidget {
  const ChessColumn({super.key, required this.matrix});
  final Matrix matrix;

  @override
  State<ChessColumn> createState() => _ChessColumnState();
}

class _ChessColumnState extends State<ChessColumn> {
  late ChessPieceNode _piece;
  late ChessController _node;

  bool _highlight = false;

  @override
  void initState() {
    super.initState();
    _initBoard();
  }

  _initBoard() {
    _piece = EmptyNode(widget.matrix);
    _node = ChessController.instance;
    _node.addListener(_listenToTheMovement);
    _node.highlight.stream.listen(_listenHighlight);
    _piece = ChessServices.instance.piecePosition()[widget.matrix] ??
        EmptyNode(widget.matrix);
    if (widget.matrix.column == 1) {
      _piece = PawnNode(true, widget.matrix);
    }
    if (widget.matrix.column == 6) {
      _piece = PawnNode(false, widget.matrix);
    }
  }

  _listenToTheMovement() {
    if (_node.droppedValue?.matrix == widget.matrix) {
      _piece = _node.pickedValue?.copyWith(widget.matrix) ??
          EmptyNode(widget.matrix);

      setState(() {});
    }
    if (_node.pickedValue?.matrix == widget.matrix) {
      _piece = EmptyNode(widget.matrix);
      setState(() {});
    }
  }

  _listenHighlight(List<Matrix> highlight) {
    if (highlight.contains(widget.matrix)) {
      _highlight = true;
    } else {
      _highlight = false;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _node.removeListener(_listenToTheMovement);
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = sizeOfColumn(context);

    return Tooltip(
      message: widget.matrix.toString(),
      triggerMode: TooltipTriggerMode.longPress,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _onTapColumn,
        child: Stack(
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              height: size,
              width: size,
              color: _getBoardColor,
              child:
                  _piece.piece != null ? SvgPicture.asset(_piece.piece!) : null,
            ),
            if (_highlight &&
                (_piece.isWhite != _node.pickedValue?.isWhite ||
                    _piece is EmptyNode))
              _highlightPiece(size),
          ],
        ),
      ),
    );
  }

  Container _highlightPiece(size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        // color: _piece is! EmptyNode ? Colors.red[200]!.withOpacity(.3) : null,
        border: Border.all(
          color: _piece is! EmptyNode ? Colors.red : Colors.transparent,
        ),
      ),
      child: Visibility(
        visible: _piece is EmptyNode,
        child: Center(
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(pi / 4),
            child: Container(
              height: 10,
              width: 10,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }

  Color get _getBoardColor {
    if (_isRecent) {
      return Colors.blue.withOpacity(.5);
    }
    return widget.matrix.rowSumColumn.isOdd
        ? ChessColors.boardBlack
        : ChessColors.chessWhite;
  }

  bool get _isRecent {
    print(_node.recentMove);
    return _node.recentMove.any((element) {
      if (element.isEqual(_piece.matrix)) {
        print('element $element   _piece ${_piece.matrix}');
      }
      return element.isEqual(_piece.matrix);
    });
  }

  _onTapColumn() {
    if (_node.pickedValue == null) {
      if (_piece is EmptyNode) return;

      _node.pickValue = _piece;
    } else if (_piece is! EmptyNode &&
        _piece.matrix != _node.pickedValue?.matrix &&
        _piece.isWhite == _node.pickedValue?.isWhite) {
      _node.pickValue = _piece;
    } else {
      _node.dropValue = _piece;
    }
  }
}

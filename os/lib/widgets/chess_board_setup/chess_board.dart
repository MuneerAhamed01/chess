import 'package:chess_os/model/chess_matrix.dart';
import 'package:chess_os/utils/chess_pieces.dart';
import 'package:chess_os/utils/size.dart';
import 'package:chess_os/widgets/chess_board_setup/chess_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/colors.dart';

class FullBoard extends StatelessWidget {
  const FullBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: _horizontalColumn,
        itemCount: 8,
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
  String? _piece;
  @override
  void initState() {
    super.initState();
    _initBoard();
  }

  _initBoard() {
    _piece = ChessServices.instance.piecePosition()[widget.matrix];
    if (widget.matrix.column == 1) {
      _piece = ChessPieceAssets.pawnWhite;
    }
    if (widget.matrix.column == 6) {
      _piece = ChessPieceAssets.pawnBlack;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = sizeOfColumn(context);

    return GestureDetector(
      onTap: _onTapColumn,
      child: Container(
        alignment: AlignmentDirectional.center,
        height: size,
        width: size,
        color: _getBoardColor,
        child: _piece != null ? SvgPicture.asset(_piece!) : null,
      ),
    );
  }

  Color get _getBoardColor => widget.matrix.rowSumColumn.isOdd
      ? ChessColors.boardBlack
      : ChessColors.chessWhite;

  _onTapColumn() {
    if (kDebugMode) {
      print("Matrix : ${widget.matrix.column} ${widget.matrix.row}");
    }
  }
}

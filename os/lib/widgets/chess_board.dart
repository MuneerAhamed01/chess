import 'package:chess_os/utils/chess_pieces.dart';
import 'package:chess_os/utils/size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/colors.dart';

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

class ChessColumn extends StatelessWidget {
  const ChessColumn({super.key, required this.matrix});
  final Matrix matrix;

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
        child: SvgPicture.asset(ChessPiece.bishopBlack),
      ),
    );
  }

  Color get _getBoardColor => matrix.rowSumColumn.isOdd
      ? ChessColors.boardBlack
      : ChessColors.chessWhite;

  _onTapColumn() {
    if (kDebugMode) {
      print("Matrix : ${matrix.column} ${matrix.row}");
    }
  }
}

class Matrix {
  final int row;
  final int column;
  Matrix(this.row, this.column);

  int get rowSumColumn => row + column;
  List<int> get matrix => [row, column];
}

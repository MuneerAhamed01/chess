import 'package:chess_os/utils/chess_pieces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'chess_board_controller.dart';
import 'package:chess_os/widgets.dart';

class ChessBoard extends GetWidget<ChessBoardController> {
  const ChessBoard({super.key});
  static const String chessBoardPage = '/';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: Center(
        child: SvgPicture.asset(
          ChessPiece.pawn,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chess_board_controller.dart';
import 'package:chess_os/widgets.dart';

class ChessBoard extends GetWidget<ChessBoardController> {
  const ChessBoard({super.key});
  static const String chessBoardPage = '/';

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWithBackground(
      child: Center(child: FullBoard()),
    );
  }
}

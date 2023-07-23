import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chess_board_controller.dart';

class ChessBoard extends GetWidget<ChessBoardController> {
  const ChessBoard({super.key});
  static const String chessBoardPage = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Chess'),
      ),
    );
  }
}

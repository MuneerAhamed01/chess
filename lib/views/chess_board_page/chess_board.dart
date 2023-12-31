import 'package:chess/widget/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chess_board_controller.dart';
import 'package:chess_os/widgets.dart';

class ChessBoard extends GetWidget<ChessBoardController> {
  const ChessBoard({super.key});
  static const String chessBoardPage = '/';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: SizedBox(
        height: Get.height,
        child: Column(
          children: [
            SafeArea(
              child: Align(
                alignment: Alignment.centerLeft.add(const Alignment(0.2, 0)),
                child: const ProfileSection(
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ),
            ),
            const FullBoard(),
            Transform.translate(
              offset: const Offset(-20, 30),
              child: const Align(
                alignment: Alignment.centerRight,
                child: ProfileSection(
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

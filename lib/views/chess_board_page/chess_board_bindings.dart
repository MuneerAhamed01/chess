import 'package:chess/views/chess_board_page/chess_board_controller.dart';
import 'package:get/get.dart';

class ChessBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChessBoardController>(() => ChessBoardController());
  }
}

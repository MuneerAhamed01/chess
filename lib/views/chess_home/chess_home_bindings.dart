import 'package:chess/views/chess_home/chess_home_controller.dart';
import 'package:get/get.dart';


class ChessHomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChessHomeController>(() => ChessHomeController());
  }
} 


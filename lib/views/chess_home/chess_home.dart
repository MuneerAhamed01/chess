import 'package:chess/views/chess_home/chess_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChessHome extends GetWidget<ChessHomeController> {
  const ChessHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Chess'),
      ),
    );
  }
}

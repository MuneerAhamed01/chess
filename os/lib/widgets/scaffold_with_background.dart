import 'dart:ui';

import 'package:chess_os/theme/colors.dart';
import 'package:flutter/material.dart';

class ScaffoldWithBackground extends StatelessWidget {
  const ScaffoldWithBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChessColors.gradientBlack,
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(-110, 90),
            child: _buildBackgroundColor(),
          ),
          Transform.translate(
            offset: const Offset(165, 300),
            child: _buildBackgroundColor(),
          ),
          child,
        ],
      ),
    );
  }

  Widget _buildBackgroundColor() {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 160, sigmaY: 160),
      child: Align(
        child: SizedBox(
          width: 380,
          height: 380,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(190),
              color: ChessColors.gradientBlue.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}

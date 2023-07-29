import 'package:flutter/material.dart';

import 'padding.dart';

sizeOfColumn(BuildContext context) {
  final Size screenSize = MediaQuery.sizeOf(context);
  const double defaultPadding = ChessPadding.chessSpaceMedium;
  const double borderCountSize = 12;
  final sizeOFColumn =
      (screenSize.width - defaultPadding - borderCountSize) / 8;
  return sizeOFColumn;
}

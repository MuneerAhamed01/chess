import 'package:flutter/material.dart';

sizeOfColumn(BuildContext context) {
  final Size screenSize = MediaQuery.sizeOf(context);
  final sizeOFColumn = (screenSize.width) / 8;
  return sizeOFColumn;
}

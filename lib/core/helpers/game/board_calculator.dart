import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:vector_math/vector_math_64.dart' as math64;

class BoardCalculator extends ChangeNotifier {
  BoardCalculator({
    required this.rowLength,
    required this.columnLength,
    required this.maxWidth,
    required this.maxHeight,
  }) {
    _initialize();
  }

  void _initialize() {
    initialized = false;
    notifyListeners();

    final widthPerRow = maxWidth / rowLength;
    final heightPerColumn = maxHeight / columnLength;

    final cellSize = min(widthPerRow, heightPerColumn);
    final scale = kCellSize / cellSize;

    boardDataMax = InteractiveBoardData(
      width: cellSize * rowLength * scale,
      height: cellSize * columnLength * scale,
      lineSize: kLineSize,
      cellSize: cellSize * scale,
      scale: scale <= 1 ? 1 : scale,
    );

    boardDataMin = InteractiveBoardData(
        width: cellSize * rowLength,
        height: cellSize * columnLength,
        lineSize: kLineSize * 1 / scale,
        cellSize: cellSize,
        scale: 1,
    );

    initialized = true;
    notifyListeners();
  }

  bool initialized = false;

  final int rowLength;
  final int columnLength;

  final double maxWidth;
  final double maxHeight;

  late InteractiveBoardData boardDataMin;
  late InteractiveBoardData boardDataMax;

}

class InteractiveBoardData {
  InteractiveBoardData({
    required this.width,
    required this.height,
    required this.lineSize,
    required this.cellSize,
    required this.scale,
  });

  final double width;
  final double height;
  final double lineSize;
  final double cellSize;
  final double scale;
}

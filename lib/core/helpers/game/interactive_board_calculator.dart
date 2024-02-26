import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:vector_math/vector_math_64.dart' as math64;

class InteractiveBoardCalculator extends ChangeNotifier {
  InteractiveBoardCalculator({
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
      scale: scale <= 1 ? 2 : scale * 2,
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

  math64.Matrix4 centerBoard(
    math64.Matrix4 matrix4,
  ) {
    if (!initialized) {
      throw Exception('InteractiveBoardCalculator is not initialized');
    }

    final matrix = matrix4.clone();
    matrix.setDiagonal(math64.Vector4(1, 1, 1, 1));
    matrix.setEntry(0, 3, 0);
    matrix.setEntry(
      1,
      3,
      (maxHeight - boardDataMin.height) / 2,
    );
    return matrix;
  }
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

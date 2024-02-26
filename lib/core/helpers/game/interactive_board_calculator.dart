import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:vector_math/vector_math_64.dart' as math64;

class InteractiveBoardCalculator extends ChangeNotifier{
  InteractiveBoardCalculator({
    required this.rowLength,
    required this.columnLength,
    required this.maxWidth,
    required this.maxHeight,
  }) {
    _initialize();
  }

  void _initialize(){
    initialized = false;
    notifyListeners();
    smallerSide = min(rowLength, columnLength);
    smallerSize = min(maxWidth, maxHeight);
    isWidthSmaller = maxWidth <= maxHeight;

    boardSize = smallerSize;
    cellSize = max(kCellSize, boardSize / smallerSide);

    boardWidth = cellSize * rowLength;
    boardHeight = cellSize * columnLength;

    isOverflow = boardWidth > maxWidth ||
        boardHeight > maxHeight;

    minScale = 1 /
        (isWidthSmaller
            ? (boardWidth / maxWidth)
            : (boardHeight / maxHeight));

    initialized = true;
    notifyListeners();
  }

  bool initialized = false;

  final int rowLength;
  final int columnLength;
  /// min(rowLength, columnLength)
  late int smallerSide;

  final double maxWidth;
  final double maxHeight;
  /// min(maxWidth, maxHeight)
  late double smallerSize;
  /// decide if width is smaller or equal than height
  late bool isWidthSmaller;

  late double cellSize;
  late double boardSize;

  late double boardWidth;
  late double boardHeight;

  /// decide if board can fit in (maxWidth, maxHeight) canvas
  late bool isOverflow;

  /// scale value at which the entire board will be visible
  late double minScale;

  math64.Matrix4 centerBoard(
      math64.Matrix4 matrix4,
      ) {
    final matrix = matrix4.clone();
    matrix.setDiagonal(math64.Vector4(minScale, minScale, minScale, 1));
    matrix.setEntry(0, 3, 0);
    matrix.setEntry(
      1,
      3,
      (maxHeight - boardHeight * minScale) / 2,
    );
    return matrix;
  }

}

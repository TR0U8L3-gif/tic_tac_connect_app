import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app_scaffold.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_board_test.dart';
import 'package:vector_math/vector_math_64.dart' as math64;

class BoardPage extends StatefulWidget {
  const BoardPage({super.key});

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  final TransformationController controller = TransformationController();

  int rowLength = 10;
  int columnLength = 10;

  @override
  Widget build(BuildContext context) {
    const lineSize = 12.0;
    const kCellSizeMin = 128.0;

    final smallerSide = min(rowLength, columnLength);

    //board math

    return AppScaffold(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final smallerSize = min(constraints.maxWidth, constraints.maxHeight);
          final isWidthSmaller = constraints.maxWidth <= constraints.maxHeight;

          final boardSize = smallerSize;
          final cellSize = max(kCellSizeMin, boardSize / smallerSide);

          final boardWidth = cellSize * rowLength;
          final boardHeight = cellSize * columnLength;

          final isOverflow = boardWidth > constraints.maxWidth ||
              boardHeight > constraints.maxHeight;

          final minScale = 1 /
              (isWidthSmaller
                  ? (boardWidth / constraints.maxWidth)
                  : (boardHeight / constraints.maxHeight));

          return Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(controller.toString()),
                    Text('smallerSize: $smallerSize, '
                        'isWidthSmaller: $isWidthSmaller, '
                        'minScale: $minScale, '
                        'size*minScale: ${constraints.maxWidth * minScale} ${constraints.maxHeight * minScale}'),
                  ],
                ),
              ),
              InteractiveViewer(
                maxScale: 1,
                minScale: minScale,
                clipBehavior: Clip.antiAlias,
                boundaryMargin: isOverflow
                    ? controller.value.entry(0, 0) >= minScale
                        ? const EdgeInsets.all(double.infinity)
                        : EdgeInsets.zero
                    : EdgeInsets.zero,
                onInteractionUpdate: (data) => setState(() {}),
                transformationController: controller,
                child: OverflowBox(
                  maxWidth: boardWidth,
                  maxHeight: boardHeight,
                  minWidth: boardWidth * minScale,
                  minHeight: boardHeight * minScale,
                  alignment: Alignment.topLeft,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      TicTacBoardTest(
                        cellSize: cellSize,
                        lineSize: lineSize,
                        columnLength: columnLength,
                        rowLength: rowLength,
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: columnLength * rowLength,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: rowLength,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            height: cellSize,
                            width: cellSize,
                            decoration: BoxDecoration(
                              color:
                                  Colors.red.withOpacity(Random().nextDouble()),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: controller.value.entry(1, 3),
                left: controller.value.entry(0, 3),
                child: Container(
                  width: 10,
                  height: 10,
                  color: Colors.green,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Slider(
                            min: 3,
                            max: 12,
                            divisions: 9,
                            value: rowLength.toDouble(),
                            onChanged: (double value) {
                              setState(() {
                                rowLength = value.toInt();
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            min: 3,
                            max: 12,
                            divisions: 9,
                            value: columnLength.toDouble(),
                            onChanged: (double value) {
                              setState(() {
                                columnLength = value.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        controller.value = _center(
                          controller.value.clone(),
                          minScale,
                          (constraints.maxHeight - boardHeight * minScale) / 2,
                        );
                      }),
                      child: const Text('Center'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  math64.Matrix4 _center(
    math64.Matrix4 matrix4,
    double minScale,
    double heightOffset,
  ) {
    final matrix = matrix4.clone();
    matrix.setDiagonal(math64.Vector4(minScale, minScale, minScale, 1));
    matrix.setEntry(0, 3, 0);
    matrix.setEntry(
      1,
      3,
      heightOffset,
    );
    return matrix;
  }
}

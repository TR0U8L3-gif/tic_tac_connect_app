import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_board.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_board_test.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_circle.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_cross.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_line.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    const lineSize = 12.0;
    const sizeFactor = 0.8;

    final size = min(context.width, context.height);
    final boardSize = size * sizeFactor;

    const rowLength = 8;
    const columnLength = 8;
    final smallerSide = min(rowLength, columnLength);
    final cellSize = 64.0;
    //= boardSize / smallerSide;
    final boardWidth = cellSize * rowLength;
    final boardHeight = cellSize * columnLength;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: boardWidth,
          height: boardHeight,
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
                padding: EdgeInsets.zero,
                itemCount: columnLength * rowLength,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: rowLength,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: cellSize,
                    width: cellSize,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(Random().nextDouble()),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

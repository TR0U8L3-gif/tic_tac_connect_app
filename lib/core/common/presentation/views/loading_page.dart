import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_board.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_circle.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_cross.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const lineSize = 12.0;
    const sizeFactor = 0.8;

    final size = min(context.width, context.height);
    final boardSize = size * sizeFactor;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: boardSize,
          height: boardSize,
          child: Stack(
            children: [
              TicTacBoard(boardSize: boardSize, lineSize: lineSize),
              Align(
                child: SizedBox(
                  width: boardSize / 3,
                  height: boardSize / 3,
                  child: Padding(
                    padding: const EdgeInsets.all(lineSize),
                    child: CircularProgressIndicator(
                      strokeWidth: lineSize,
                      backgroundColor:
                          context.theme.colorScheme.primary.withOpacity(0.6),
                      strokeCap: StrokeCap.round,
                      strokeAlign: -1,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TicTacCircle(
                  size: boardSize / 3,
                  lineWidth: lineSize,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TicTacCross(
                  size: boardSize / 3,
                  lineWidth: lineSize,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: TicTacCross(
                  size: boardSize/ 3,
                  lineWidth: lineSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

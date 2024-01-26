import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_line.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class TicTacTriangle extends StatelessWidget {
  const TicTacTriangle({
    required this.size,
    required this.lineWidth,
    super.key,
  });
  final double size;
  final double lineWidth;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(lineWidth),

      child: LayoutBuilder(
        builder: (context, constraints) {
          final boxSize = min(constraints.maxHeight, constraints.maxWidth);
          final h = boxSize * sqrt(3) / 2;
          final hp = boxSize - h;
          return Transform.translate(
            offset: Offset(0,  - hp /2 + lineWidth / 8),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                TicTacLine(
                  width: boxSize,
                  height: lineWidth,
                ),
                Transform.translate(
                  offset: Offset(   lineWidth / 4,   lineWidth / 4),
                  child: Transform.rotate(
                    angle: - pi / 3.0,
                    alignment: Alignment.centerLeft,
                    child: TicTacLine(
                      width: boxSize,
                      height: lineWidth,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(  - lineWidth / 4,   lineWidth / 4),
                  child: Transform.rotate(
                    angle: pi / 3.0,
                    alignment: Alignment.centerRight,
                    child: TicTacLine(
                      width: boxSize,
                      height: lineWidth,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

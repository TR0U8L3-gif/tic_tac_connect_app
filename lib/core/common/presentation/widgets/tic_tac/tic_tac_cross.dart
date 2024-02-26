import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_line.dart';

class TicTacCross extends StatelessWidget {
  const TicTacCross({
    required this.size,
    required this.lineWidth,
    super.key,
  });
  final double size;
  final double lineWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: OverflowBox(
        maxHeight: size * sqrt2,
        maxWidth: size * sqrt2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: pi * 0.25,
              child: TicTacLine(
                width: size ,
                height: lineWidth,
              ),
            ),
            Transform.rotate(
              angle: pi * -0.25,
              child: TicTacLine(
                width: size ,
                height: lineWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

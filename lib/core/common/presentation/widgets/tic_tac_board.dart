import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_line.dart';

class TicTacBoard extends StatelessWidget {
  const TicTacBoard({
    required this.boardSize,
    required this.lineSize,
    super.key,
  });

  final double boardSize;
  final double lineSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boardSize,
      height: boardSize,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TicTacLine(
                width: double.infinity,
                height: lineSize,
              ),
              TicTacLine(
                width: double.infinity,
                height: lineSize,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TicTacLine(
                width: lineSize,
                height: double.infinity,
              ),
              TicTacLine(
                width: lineSize,
                height: double.infinity,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

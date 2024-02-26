import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_line.dart';

class TicTacBoardSized extends StatelessWidget {
  const TicTacBoardSized({
    required this.cellSize,
    required this.lineSize,
    required this.rowLength,
    required this.columnLength,
    super.key,
  });

  final double cellSize;
  final double lineSize;
  ///x
  final int rowLength;
  ///y
  final int columnLength;

  @override
  Widget build(BuildContext context) {
    final boardWidth = cellSize * rowLength;
    final boardHeight = cellSize * columnLength;
    return SizedBox(
      width: boardWidth,
      height: boardHeight,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: lineSize/2,
              ),
              for(var i = 0; i < columnLength - 1; i++)
                TicTacLine(
                  width: boardWidth,
                  height: lineSize,
                  padding: EdgeInsets.only(top: cellSize - lineSize),
                ),
              SizedBox(
                height: lineSize/2,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: lineSize/2,
              ),
              for(var i = 0; i < rowLength - 1; i++)
                TicTacLine(
                  width: lineSize,
                  height: boardHeight,
                  padding: EdgeInsets.only(left: cellSize - lineSize),
                ),
              SizedBox(
                width: lineSize/2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

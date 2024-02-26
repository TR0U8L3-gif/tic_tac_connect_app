import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_board_sized.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_line.dart';
import 'package:tic_tac_connect_app/core/helpers/game/board_calculations/board_calculator.dart';

class TicTacBoardResponsive extends StatelessWidget {
  const TicTacBoardResponsive({
    required this.rowLength,
    required this.columnLength,
    required this.maxWidth,
    required this.maxHeight,
    this.onDoubleTap,
    this.onTap,
    super.key,
  });

  ///x
  final int rowLength;

  ///y
  final int columnLength;

  final double maxWidth;

  final double maxHeight;
  final void Function(int index)? onDoubleTap;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    final calculator = BoardCalculator(
      rowLength: rowLength,
      columnLength: columnLength,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );

    return Stack(
      children: [
        TicTacBoardSized(
          cellSize: calculator.boardDataMin.cellSize,
          lineSize: calculator.boardDataMin.lineSize,
          columnLength: columnLength,
          rowLength: rowLength,
        ),
        SizedBox(
          width: calculator.boardDataMin.width,
          height: calculator.boardDataMin.height,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: columnLength * rowLength,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: rowLength,
            ),
            itemBuilder: (context, index) {
              return SizedBox(
                width: calculator.boardDataMin.cellSize,
                height: calculator.boardDataMin.cellSize,
                child: InkWell(
                  onDoubleTap: () => onDoubleTap?.call(index),
                  onTap: () => onTap?.call(index),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app_scaffold.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_board_responsive.dart';
import 'package:tic_tac_connect_app/core/helpers/game/board_calculator.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({super.key});

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  int rowLength = 10;
  int columnLength = 10;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final calculator = BoardCalculator(
            rowLength: rowLength,
            columnLength: columnLength,
            maxWidth: constraints.maxWidth,
            maxHeight: constraints.maxHeight,
          );
          debugPrint('${calculator.boardDataMin.width} ${calculator.boardDataMin.height}');
          return Stack(
            children: [
              Align(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    TicTacBoardResponsive(
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
                          return Container(
                            width: 10,
                            height: 10,
                            color: Colors.teal.withOpacity(Random().nextDouble()),
                            child: InkWell(
                              onTap: () => debugPrint('$index '
                                  'x:${index % rowLength} '
                                  'y:${index ~/ rowLength}'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
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
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

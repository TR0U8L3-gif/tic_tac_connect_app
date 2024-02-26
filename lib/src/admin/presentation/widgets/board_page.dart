import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app/app_scaffold.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_board_responsive.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_board_sized.dart';
import 'package:tic_tac_connect_app/core/helpers/game/board_calculations/board_calculator.dart';

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
          return Stack(
            children: [
              Align(
                child: TicTacBoardResponsive(
                  rowLength: rowLength,
                  columnLength: columnLength,
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight,
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

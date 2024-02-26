import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app_scaffold.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_board_responsive.dart';
import 'package:tic_tac_connect_app/core/helpers/game/interactive_board_calculator.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';

class InteractiveBoardPage extends StatefulWidget {
  const InteractiveBoardPage({super.key});

  @override
  State<InteractiveBoardPage> createState() => _InteractiveBoardPageState();
}

class _InteractiveBoardPageState extends State<InteractiveBoardPage> {
  final TransformationController controller = TransformationController();

  int rowLength = 10;
  int columnLength = 10;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final calculator = InteractiveBoardCalculator(
            rowLength: rowLength,
            columnLength: columnLength,
            maxWidth: constraints.maxWidth,
            maxHeight: constraints.maxHeight,
          );
          return ListenableBuilder(
            listenable: calculator,
            builder: (
              context,
              child,
            ) {
              if (calculator.initialized) {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Text(controller.toString()),
                          Text('smallerSize: ${calculator.smallerSize}, '
                              'isWidthSmaller: ${calculator.isWidthSmaller}, '
                              'minScale: ${calculator.minScale}, '
                              'size*minScale: ${constraints.maxWidth * calculator.minScale} ${constraints.maxHeight * calculator.minScale}'),
                        ],
                      ),
                    ),
                    InteractiveViewer(
                      maxScale: 1,
                      minScale: calculator.minScale,
                      clipBehavior: Clip.antiAlias,
                      boundaryMargin: calculator.isOverflow
                          ? controller.value.entry(0, 0) >= calculator.minScale
                              ? const EdgeInsets.all(double.infinity)
                              : EdgeInsets.zero
                          : EdgeInsets.zero,
                      onInteractionUpdate: (data) => setState(() {}),
                      transformationController: controller,
                      child: OverflowBox(
                        maxWidth: calculator.boardWidth,
                        maxHeight: calculator.boardHeight,
                        minWidth: calculator.boardWidth * calculator.minScale,
                        minHeight: calculator.boardHeight * calculator.minScale,
                        alignment: Alignment.topLeft,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            TicTacBoardResponsive(
                              cellSize: calculator.cellSize,
                              lineSize: kLineSize,
                              columnLength: columnLength,
                              rowLength: rowLength,
                            ),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: columnLength * rowLength,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: rowLength,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => debugPrint('$index '
                                      'x:${index % rowLength} '
                                      'y:${index ~/ rowLength}'),
                                  child: SizedBox(
                                    height: calculator.cellSize,
                                    width: calculator.cellSize,
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
                              controller.value = calculator
                                  .centerBoard(controller.value.clone());
                            }),
                            child: const Text('Center'),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}

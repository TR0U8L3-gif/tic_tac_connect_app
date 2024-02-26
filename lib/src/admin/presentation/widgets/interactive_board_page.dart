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

  String text = 'none';

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
                      child: Text('last click: $text'),
                    ),
                    InteractiveViewer(
                      maxScale: calculator.boardDataMax.scale,
                      minScale: calculator.boardDataMin.scale,
                      clipBehavior: Clip.antiAlias,
                      boundaryMargin: const EdgeInsets.all(double.infinity),
                      onInteractionUpdate: (data) => setState(() {}),
                      transformationController: controller,
                      child: OverflowBox(
                        maxWidth: calculator.boardDataMax.width,
                        maxHeight: calculator.boardDataMax.height,
                        minWidth: calculator.boardDataMin.width,
                        minHeight: calculator.boardDataMin.height,
                        alignment: Alignment.topLeft,
                        child: Stack(
                          //alignment: Alignment.center,
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
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: rowLength,
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: calculator.boardDataMin.cellSize,
                                    height: calculator.boardDataMin.cellSize,
                                    color: Colors.tealAccent.withOpacity(Random().nextDouble()),
                                    child: InkWell(
                                      onDoubleTap: () => setState(() {
                                        text = '$index '
                                            'x:${index % rowLength} '
                                            'y:${index ~/ rowLength}';
                                      }),
                                    ),
                                  );
                                },
                              ),
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

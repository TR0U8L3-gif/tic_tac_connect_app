import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_circle.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_cross.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_line.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  static const kLineSize = 12.0;
  static const kSizeFactor = 0.8;

  @override
  Widget build(BuildContext context) {
    final size = min(context.width, context.height);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size * kSizeFactor,
          height: size * kSizeFactor,
          child: Stack(
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TicTacLine(
                    width: double.infinity,
                    height: kLineSize,
                  ),
                  TicTacLine(
                    width: double.infinity,
                    height: kLineSize,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TicTacLine(
                    width: kLineSize,
                    height: double.infinity,
                  ),
                  TicTacLine(
                    width: kLineSize,
                    height: double.infinity,
                  ),
                ],
              ),
              Align(
                child: SizedBox(
                  width: size * kSizeFactor / 3,
                  height: size * kSizeFactor / 3,
                  child: Padding(
                    padding: const EdgeInsets.all(kLineSize * 1.64),
                    child: CircularProgressIndicator(
                      strokeWidth: kLineSize * kSizeFactor * 0.8,
                      backgroundColor:
                          context.theme.colorScheme.primary.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: size * kSizeFactor / 3,
                  height: size * kSizeFactor / 3,
                  child: TicTacCircle(
                    size: size * kSizeFactor / 3,
                    lineWidth: kLineSize * kSizeFactor * 0.8,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: size * kSizeFactor / 3,
                  height: size * kSizeFactor / 3,
                  child: TicTacCross(
                    size: size * kSizeFactor / 3,
                    lineWidth: kLineSize * kSizeFactor * 0.8,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: size * kSizeFactor / 3,
                  height: size * kSizeFactor / 3,
                  child: TicTacCross(
                    size: size * kSizeFactor / 3,
                    lineWidth: kLineSize * kSizeFactor * 0.8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

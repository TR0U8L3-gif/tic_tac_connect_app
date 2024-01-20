import 'dart:math';

import 'package:flutter/material.dart';
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _line(
                    context: context,
                    width: double.infinity,
                    height: kLineSize,
                  ),
                  _line(
                    context: context,
                    width: double.infinity,
                    height: kLineSize,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _line(
                    context: context,
                    width: kLineSize,
                    height: double.infinity,
                  ),
                  _line(
                    context: context,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _line({
    required BuildContext context,
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

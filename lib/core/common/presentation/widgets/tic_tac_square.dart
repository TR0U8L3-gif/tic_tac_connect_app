import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class TicTacSquare extends StatelessWidget {
  const TicTacSquare({
    required this.size,
    required this.lineWidth,
    super.key,
  });

  final double size;
  final double lineWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(lineWidth),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(kBorderRadiusCircular),
          border: Border.all(
            color: context.theme.colorScheme.primary,
            width: lineWidth,
          ),
        ),
      ),
    );
  }
}

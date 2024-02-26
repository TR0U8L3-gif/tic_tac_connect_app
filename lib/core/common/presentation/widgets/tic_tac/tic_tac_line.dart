import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class TicTacLine extends StatelessWidget {
  const TicTacLine({
    required this.width,
    required this.height,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  final double width;
  final double height;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

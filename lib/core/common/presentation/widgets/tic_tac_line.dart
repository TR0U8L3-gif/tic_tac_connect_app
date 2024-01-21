import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class Line extends StatelessWidget {
  const Line({required this.width, required this.height, super.key});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
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

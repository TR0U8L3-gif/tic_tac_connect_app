import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class ThemeGridItem extends StatelessWidget {
  const ThemeGridItem({required this.color, required this.onTap, super.key});
  
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: context.width * 0.05,
          height: context.width * 0.05,
          color: color,
        ),
      ),
    );
  }
}

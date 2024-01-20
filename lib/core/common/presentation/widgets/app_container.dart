import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    required this.child,
    this.width,
    this.height,
    super.key,
  });

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadiusCircular),
        color: context.theme.colorScheme.surface,
      ),
      width: width ?? double.infinity,
      height: height,
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}

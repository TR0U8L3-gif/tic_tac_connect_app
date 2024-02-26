import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    this.width,
    this.height,
    this.padding,
    this.onTap,
    super.key,
  });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: () => onTap ?? context.router.pop(),
      style: ElevatedButton.styleFrom(
        padding: padding ?? const EdgeInsets.all(12),
        backgroundColor: context.theme.colorScheme.surface,
        foregroundColor: context.theme.colorScheme.onBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fixedSize: Size(
          width ?? 48,
          height ?? 48,
        ),
      ),
    );
  }
}

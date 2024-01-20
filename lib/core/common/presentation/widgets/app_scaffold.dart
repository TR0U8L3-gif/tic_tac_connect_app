import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({this.padding, this.child, super.key});
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding ?? const EdgeInsets.all(24),
          child: child,
        ),
      ),
    );
  }
}

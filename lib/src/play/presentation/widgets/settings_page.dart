import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    required super.key,
    required this.padding,
    required this.width,
    required this.height,
    required this.child,
  });

  final double padding;
  final Widget child;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: child,
    );
  }
}

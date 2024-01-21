import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PlayNavigationPage extends StatelessWidget {
  const PlayNavigationPage({super.key});

  static const String tabName = 'play';

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

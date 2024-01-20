import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GameModesPage extends StatelessWidget {
  const GameModesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () => context.router.pushNamed('game-settings'),
            child: Text('opcje')),
      ),
    );
  }
}

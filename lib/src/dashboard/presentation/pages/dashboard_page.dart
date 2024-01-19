import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/tutorial_page.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/pages/theme_page.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dashboard'),
        centerTitle: true,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              context.router.pushNamed(TutorialPage.routeName);
            },
            child: const Text('tutorial'),
          ),
          ElevatedButton(
            onPressed: () {
              context.router.pushNamed(ThemePage.routeName);
            },
            child: const Text('theme'),
          ),
        ],
      ),
    );
  }
}

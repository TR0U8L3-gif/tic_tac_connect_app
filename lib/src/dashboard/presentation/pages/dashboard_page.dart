import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tic_tac_connect_app/config/routes/app_router.gr.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/tutorial_page.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/pages/theme_page.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        PlayRoute(),
        LearnRoute(),
        ProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) =>
          FadeTransition(
            opacity: animation,
            child: child,
          ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(tabsRouter.current.path),
            centerTitle: true,
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            unselectedFontSize: 14,
            backgroundColor: context.theme.colorScheme.surface,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Ionicons.grid_outline),
                label: 'play',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.school_outline),
                label: 'learn',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.person_outline),
                label: 'profile',
              ),
            ],
          ),
        );
      },
    );
  }
}

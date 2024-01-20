import 'package:auto_route/auto_route.dart';
import 'package:tic_tac_connect_app/config/routes/app_router.gr.dart';
import 'package:tic_tac_connect_app/config/routes/guard/on_boarding_guard.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/dashboard_page.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/learn_navigation_page.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/play_navigation_page.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/profile_navigation_page.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/tutorial_page.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/pages/theme_page.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnBoardingRoute.page,
          path: OnBoardingPage.routeName,
          guards: [OnBoardingGuard()],
          initial: true,
        ),
        AutoRoute(
          page: TutorialRoute.page,
          path: TutorialPage.routeName,
        ),
        AutoRoute(
          page: DashboardRoute.page,
          path: DashboardPage.routeName,
          children: [
            AutoRoute(
              page: PlayNavigationRoute.page,
              path: PlayNavigationPage.tabName,
              children: [
                AutoRoute(
                  page: GameModesRoute.page,
                  path: 'game-modes',
                  initial: true,
                ),
                AutoRoute(page: GameSettingsRoute.page, path: 'game-settings'),
              ],
            ),
            AutoRoute(
              page: LearnNavigationRoute.page,
              path: LearnNavigationPage.tabName,
            ),
            AutoRoute(
              page: ProfileNavigationRoute.page,
              path: ProfileNavigationPage.tabName,
            ),
          ],
        ),
        AutoRoute(
          page: ThemeRoute.page,
          path: ThemePage.routeName,
        ),
      ];
}

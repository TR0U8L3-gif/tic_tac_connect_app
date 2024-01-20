import 'package:auto_route/auto_route.dart';
import 'package:tic_tac_connect_app/config/routes/app_router.gr.dart';
import 'package:tic_tac_connect_app/config/routes/guard/on_boarding_guard.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/dashboard_page.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/learn_page.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/play_page.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/profile_page.dart';
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
            AutoRoute(page: PlayRoute.page, path: PlayPage.tabName),
            AutoRoute(page: LearnRoute.page, path: LearnPage.tabName),
            AutoRoute(page: ProfileRoute.page, path: ProfilePage.tabName),
          ],
        ),
        AutoRoute(
          page: ThemeRoute.page,
          path: ThemePage.routeName,
        ),

      ];
}

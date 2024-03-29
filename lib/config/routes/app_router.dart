import 'package:auto_route/auto_route.dart';
import 'package:tic_tac_connect_app/config/routes/app_router.gr.dart';
import 'package:tic_tac_connect_app/config/routes/guard/admin_guard.dart';
import 'package:tic_tac_connect_app/config/routes/guard/on_boarding_guard.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/src/admin/presentation/pages/admin_page.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/dashboard_page.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/navigation/learn_navigation_page.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/navigation/play_navigation_page.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/navigation/profile_navigation_page.dart';
import 'package:tic_tac_connect_app/src/initialization/presentation/pages/init_page.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/tutorial_page.dart';
import 'package:tic_tac_connect_app/src/play/presentation/pages/game_modes_page.dart';
import 'package:tic_tac_connect_app/src/play/presentation/pages/game_settings_page.dart';
import 'package:tic_tac_connect_app/src/play/presentation/pages/games/computer_game_page.dart';
import 'package:tic_tac_connect_app/src/play/presentation/pages/games/match_game_page.dart';
import 'package:tic_tac_connect_app/src/profile/presentation/pages/profile_page.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/pages/theme_page.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: InitRoute.page,
          path: InitPage.routeName,
          initial: true,
        ),
        AutoRoute(
          page: OnBoardingRoute.page,
          path: OnBoardingPage.routeName,
          guards: [OnBoardingGuard()],
        ),
        AutoRoute(
          page: TutorialRoute.page,
          path: TutorialPage.routeName,
        ),
        CustomRoute(
          page: DashboardRoute.page,
          path: DashboardPage.routeName,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: kDuration600.inMilliseconds,
          children: [
            AutoRoute(
              page: PlayNavigationRoute.page,
              path: PlayNavigationPage.tabName,
              children: [
                AutoRoute(
                  page: GameModesRoute.page,
                  path: GameModesPage.tabName,
                  initial: true,
                ),
                CustomRoute(
                  page: MatchGameRoute.page,
                  path: MatchGamePage.tabName,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: kDuration200.inMilliseconds,
                ),
                CustomRoute(
                  page: ComputerGameRoute.page,
                  path: ComputerGamePage.tabName,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: kDuration200.inMilliseconds,
                ),
                CustomRoute(
                  page: GameSettingRoute.page,
                  path: GameSettingPage.tabName,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: kDuration200.inMilliseconds,
                ),
              ],
            ),
            AutoRoute(
              page: LearnNavigationRoute.page,
              path: LearnNavigationPage.tabName,
            ),
            AutoRoute(
              page: ProfileNavigationRoute.page,
              path: ProfileNavigationPage.tabName,
              children: [
                AutoRoute(
                  page: ProfileRoute.page,
                  path: ProfilePage.tabName,
                  initial: true,
                ),
                CustomRoute(
                  page: ThemeRoute.page,
                  path: ThemePage.tabName,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: kDuration200.inMilliseconds,
                ),
                CustomRoute(
                  page: AdminRoute.page,
                  path: AdminPage.tabName,
                  guards: [AdminGuard()],
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: kDuration200.inMilliseconds,
                ),
              ],
            ),
          ],
        ),
      ];
}

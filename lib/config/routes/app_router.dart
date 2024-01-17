import 'package:auto_route/auto_route.dart';
import 'package:tic_tac_connect_app/config/routes/app_router.gr.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/on_boarding_page.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnBoardingRoute.page,
          path: OnBoardingPage.routeName,
          initial: true,
        ),
      ];
}

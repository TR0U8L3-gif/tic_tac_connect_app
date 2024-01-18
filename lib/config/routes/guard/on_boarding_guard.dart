import 'package:auto_route/auto_route.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tic_tac_connect_app/core/common/domain/usecase/use_case.dart';
import 'package:tic_tac_connect_app/core/services/dependency_injection/injection_container.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/dashboard_page.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/use_cases/check_if_first_timer.dart';

class OnBoardingGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final result = await sl<CheckIfFirstTimer>()(NoParams());
    result.fold(
      (l) => resolver.next(),
      (r) {
        if(r){
          resolver.next();
        } else {
          router.replaceNamed(DashboardPage.routeName);
        }
      },
    );

    FlutterNativeSplash.remove();
  }
}

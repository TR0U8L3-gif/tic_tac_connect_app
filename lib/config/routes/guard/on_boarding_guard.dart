import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tic_tac_connect_app/core/services/dependency_injection/injection_container.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/dashboard_page.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/manager/on_boarding_bloc.dart';

class OnBoardingGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final bloc = sl<OnBoardingBloc>();

    StreamSubscription<OnBoardingState>? streamSubscription;
    streamSubscription = bloc.stream.listen(
      (state) {
        if (state is OnBoardingStatusState) {
          if (state.isFirstTimer) {
            resolver.next();
          } else {
            //TO DO
            //router.replaceNamed(DashboardPage.routeName);
            resolver.next(false);
          }
          streamSubscription?.cancel();
        }
      },
      onError: (Object e) {
        debugPrint('onError $e');
        resolver.next();
        streamSubscription?.cancel();
      },
      onDone: () {
        debugPrint('onDone');
      },
    );

    bloc.add(
      const ShowOnBoardingEvent(checkIfFirstTimer: true),
    );
  }
}

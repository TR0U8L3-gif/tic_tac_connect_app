// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/dashboard_page.dart'
    as _i1;
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/on_boarding_page.dart'
    as _i2;
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/tutorial_page.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(child: const _i2.OnBoardingPage()),
      );
    },
    TutorialRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(child: const _i3.TutorialPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i4.PageRouteInfo<void> {
  const DashboardRoute({List<_i4.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OnBoardingPage]
class OnBoardingRoute extends _i4.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i4.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TutorialPage]
class TutorialRoute extends _i4.PageRouteInfo<void> {
  const TutorialRoute({List<_i4.PageRouteInfo>? children})
      : super(
          TutorialRoute.name,
          initialChildren: children,
        );

  static const String name = 'TutorialRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

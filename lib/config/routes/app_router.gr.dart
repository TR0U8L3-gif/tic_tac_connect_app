// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/on_boarding_page.dart'
    as _i1;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    OnBoardingRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.WrappedRoute(child: const _i1.OnBoardingPage()),
      );
    }
  };
}

/// generated route for
/// [_i1.OnBoardingPage]
class OnBoardingRoute extends _i2.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i2.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}

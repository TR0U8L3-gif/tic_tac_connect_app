// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/dashboard_page.dart'
    as _i1;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/learn_navigation_page.dart'
    as _i4;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/play_navigation_page.dart'
    as _i6;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/profile_navigation_page.dart'
    as _i7;
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/on_boarding_page.dart'
    as _i5;
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/tutorial_page.dart'
    as _i10;
import 'package:tic_tac_connect_app/src/play/presentation/pages/game_modes_page.dart'
    as _i2;
import 'package:tic_tac_connect_app/src/play/presentation/pages/game_settings_page.dart'
    as _i3;
import 'package:tic_tac_connect_app/src/profile/presentation/pages/profile_page.dart'
    as _i8;
import 'package:tic_tac_connect_app/src/theme_changer/presentation/pages/theme_page.dart'
    as _i9;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    GameModesRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.GameModesPage(),
      );
    },
    GameSettingsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GameSettingsPage(),
      );
    },
    LearnNavigationRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LearnNavigationPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i5.OnBoardingPage()),
      );
    },
    PlayNavigationRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PlayNavigationPage(),
      );
    },
    ProfileNavigationRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfileNavigationPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfilePage(),
      );
    },
    ThemeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ThemePage(),
      );
    },
    TutorialRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i10.TutorialPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i11.PageRouteInfo<void> {
  const DashboardRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.GameModesPage]
class GameModesRoute extends _i11.PageRouteInfo<void> {
  const GameModesRoute({List<_i11.PageRouteInfo>? children})
      : super(
          GameModesRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameModesRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GameSettingsPage]
class GameSettingsRoute extends _i11.PageRouteInfo<void> {
  const GameSettingsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          GameSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameSettingsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LearnNavigationPage]
class LearnNavigationRoute extends _i11.PageRouteInfo<void> {
  const LearnNavigationRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LearnNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LearnNavigationRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OnBoardingPage]
class OnBoardingRoute extends _i11.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PlayNavigationPage]
class PlayNavigationRoute extends _i11.PageRouteInfo<void> {
  const PlayNavigationRoute({List<_i11.PageRouteInfo>? children})
      : super(
          PlayNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayNavigationRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProfileNavigationPage]
class ProfileNavigationRoute extends _i11.PageRouteInfo<void> {
  const ProfileNavigationRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileNavigationRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ThemePage]
class ThemeRoute extends _i11.PageRouteInfo<void> {
  const ThemeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ThemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TutorialPage]
class TutorialRoute extends _i11.PageRouteInfo<void> {
  const TutorialRoute({List<_i11.PageRouteInfo>? children})
      : super(
          TutorialRoute.name,
          initialChildren: children,
        );

  static const String name = 'TutorialRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/dashboard_page.dart'
    as _i2;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/navigation/learn_navigation_page.dart'
    as _i5;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/navigation/play_navigation_page.dart'
    as _i8;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/navigation/profile_navigation_page.dart'
    as _i9;
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/on_boarding_page.dart'
    as _i7;
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/tutorial_page.dart'
    as _i12;
import 'package:tic_tac_connect_app/src/play/presentation/pages/game_modes_page.dart'
    as _i3;
import 'package:tic_tac_connect_app/src/play/presentation/pages/game_settings_page.dart'
    as _i4;
import 'package:tic_tac_connect_app/src/play/presentation/pages/games/computer_game_page.dart'
    as _i1;
import 'package:tic_tac_connect_app/src/play/presentation/pages/games/match_game_page.dart'
    as _i6;
import 'package:tic_tac_connect_app/src/profile/presentation/pages/profile_page.dart'
    as _i10;
import 'package:tic_tac_connect_app/src/theme_changer/presentation/pages/theme_page.dart'
    as _i11;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    ComputerGameRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ComputerGamePage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i2.DashboardPage()),
      );
    },
    GameModesRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GameModesPage(),
      );
    },
    GameSettingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.GameSettingPage(),
      );
    },
    LearnNavigationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LearnNavigationPage(),
      );
    },
    MatchGameRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MatchGamePage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i7.OnBoardingPage()),
      );
    },
    PlayNavigationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PlayNavigationPage(),
      );
    },
    ProfileNavigationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileNavigationPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ProfilePage(),
      );
    },
    ThemeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ThemePage(),
      );
    },
    TutorialRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i12.TutorialPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.ComputerGamePage]
class ComputerGameRoute extends _i13.PageRouteInfo<void> {
  const ComputerGameRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ComputerGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComputerGameRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i13.PageRouteInfo<void> {
  const DashboardRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GameModesPage]
class GameModesRoute extends _i13.PageRouteInfo<void> {
  const GameModesRoute({List<_i13.PageRouteInfo>? children})
      : super(
          GameModesRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameModesRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.GameSettingPage]
class GameSettingRoute extends _i13.PageRouteInfo<void> {
  const GameSettingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          GameSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameSettingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LearnNavigationPage]
class LearnNavigationRoute extends _i13.PageRouteInfo<void> {
  const LearnNavigationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LearnNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LearnNavigationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MatchGamePage]
class MatchGameRoute extends _i13.PageRouteInfo<void> {
  const MatchGameRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MatchGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'MatchGameRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnBoardingPage]
class OnBoardingRoute extends _i13.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PlayNavigationPage]
class PlayNavigationRoute extends _i13.PageRouteInfo<void> {
  const PlayNavigationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          PlayNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayNavigationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfileNavigationPage]
class ProfileNavigationRoute extends _i13.PageRouteInfo<void> {
  const ProfileNavigationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileNavigationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ThemePage]
class ThemeRoute extends _i13.PageRouteInfo<void> {
  const ThemeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ThemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.TutorialPage]
class TutorialRoute extends _i13.PageRouteInfo<void> {
  const TutorialRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TutorialRoute.name,
          initialChildren: children,
        );

  static const String name = 'TutorialRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

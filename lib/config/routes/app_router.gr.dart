// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:tic_tac_connect_app/src/admin/presentation/pages/admin_page.dart'
    as _i1;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/dashboard_page.dart'
    as _i3;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/navigation/learn_navigation_page.dart'
    as _i7;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/navigation/play_navigation_page.dart'
    as _i10;
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/navigation/profile_navigation_page.dart'
    as _i11;
import 'package:tic_tac_connect_app/src/initialization/presentation/pages/init_page.dart'
    as _i6;
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/on_boarding_page.dart'
    as _i9;
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/tutorial_page.dart'
    as _i14;
import 'package:tic_tac_connect_app/src/play/presentation/pages/game_modes_page.dart'
    as _i4;
import 'package:tic_tac_connect_app/src/play/presentation/pages/game_settings_page.dart'
    as _i5;
import 'package:tic_tac_connect_app/src/play/presentation/pages/games/computer_game_page.dart'
    as _i2;
import 'package:tic_tac_connect_app/src/play/presentation/pages/games/match_game_page.dart'
    as _i8;
import 'package:tic_tac_connect_app/src/profile/presentation/pages/profile_page.dart'
    as _i12;
import 'package:tic_tac_connect_app/src/theme_changer/presentation/pages/theme_page.dart'
    as _i13;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AdminRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdminPage(),
      );
    },
    ComputerGameRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ComputerGamePage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i3.DashboardPage()),
      );
    },
    GameModesRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.GameModesPage(),
      );
    },
    GameSettingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.GameSettingPage(),
      );
    },
    InitRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i6.InitPage()),
      );
    },
    LearnNavigationRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LearnNavigationPage(),
      );
    },
    MatchGameRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MatchGamePage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i9.OnBoardingPage()),
      );
    },
    PlayNavigationRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PlayNavigationPage(),
      );
    },
    ProfileNavigationRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ProfileNavigationPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ProfilePage(),
      );
    },
    ThemeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ThemePage(),
      );
    },
    TutorialRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i14.TutorialPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.AdminPage]
class AdminRoute extends _i15.PageRouteInfo<void> {
  const AdminRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AdminRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ComputerGamePage]
class ComputerGameRoute extends _i15.PageRouteInfo<void> {
  const ComputerGameRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ComputerGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComputerGameRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i15.PageRouteInfo<void> {
  const DashboardRoute({List<_i15.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.GameModesPage]
class GameModesRoute extends _i15.PageRouteInfo<void> {
  const GameModesRoute({List<_i15.PageRouteInfo>? children})
      : super(
          GameModesRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameModesRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.GameSettingPage]
class GameSettingRoute extends _i15.PageRouteInfo<void> {
  const GameSettingRoute({List<_i15.PageRouteInfo>? children})
      : super(
          GameSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameSettingRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.InitPage]
class InitRoute extends _i15.PageRouteInfo<void> {
  const InitRoute({List<_i15.PageRouteInfo>? children})
      : super(
          InitRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LearnNavigationPage]
class LearnNavigationRoute extends _i15.PageRouteInfo<void> {
  const LearnNavigationRoute({List<_i15.PageRouteInfo>? children})
      : super(
          LearnNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LearnNavigationRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MatchGamePage]
class MatchGameRoute extends _i15.PageRouteInfo<void> {
  const MatchGameRoute({List<_i15.PageRouteInfo>? children})
      : super(
          MatchGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'MatchGameRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnBoardingPage]
class OnBoardingRoute extends _i15.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i15.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PlayNavigationPage]
class PlayNavigationRoute extends _i15.PageRouteInfo<void> {
  const PlayNavigationRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PlayNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayNavigationRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProfileNavigationPage]
class ProfileNavigationRoute extends _i15.PageRouteInfo<void> {
  const ProfileNavigationRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ProfileNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileNavigationRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ProfilePage]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ThemePage]
class ThemeRoute extends _i15.PageRouteInfo<void> {
  const ThemeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ThemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.TutorialPage]
class TutorialRoute extends _i15.PageRouteInfo<void> {
  const TutorialRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TutorialRoute.name,
          initialChildren: children,
        );

  static const String name = 'TutorialRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

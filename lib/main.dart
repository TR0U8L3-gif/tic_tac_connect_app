import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tic_tac_connect_app/config/routes/app_router.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';
import 'package:tic_tac_connect_app/core/services/dependency_injection/injection_container.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/manager/theme_changer_bloc.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await setupServiceLocator();
  await sl.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ThemeChangerBloc>()..add(const ThemeChangerGetThemeEvent()),
      child: BlocBuilder<ThemeChangerBloc, ThemeChangerState>(
        builder: (context, state) {
          final theme = AppThemes.getTheme(state.themeChange.name);
          final mode = AppThemes.getMode(state.themeChange.brightness);
          final appRouter = sl<AppRouter>();
          return MaterialApp.router(
            routerConfig: appRouter.config(),
            theme: theme.light,
            darkTheme: theme.dark,
            themeMode: mode,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

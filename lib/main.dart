import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_connect_app/config/routes/app_router.dart';
import 'package:tic_tac_connect_app/core/common/providers/theme_provider.dart';
import 'package:tic_tac_connect_app/core/services/dependency_injection/injection_container.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await setupServiceLocator();
  await sl.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      builder: (context, child) {
        final theme = context.watch<ThemeProvider>();
        return MaterialApp.router(
          routerConfig: sl<AppRouter>().config(),
          theme: theme.light,
          darkTheme: theme.dark,
          themeMode: theme.mode,
        );
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app_back_button.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/manager/theme_changer_bloc.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/widgets/theme_grid_builder.dart';

@RoutePage()
class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  static const routeName = '/theme';

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                child: BlocBuilder<ThemeChangerBloc, ThemeChangerState>(
                  builder: (context, state) {
                    final themeChange = state.themeChange;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Theme',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: context.theme.colorScheme.surface,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Dark mode',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Ionicons.moon_outline,
                                    size: 28,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    themeChange.brightness ==
                                            AppThemesBrightness.light
                                        ? 'Off'
                                        : 'On',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Switch(
                                    value: themeChange.brightness ==
                                        AppThemesBrightness.dark,
                                    onChanged: (isDark) {
                                      context.read<ThemeChangerBloc>().add(
                                            ThemeChangerChangeThemeEvent(
                                              brightness: isDark
                                                  ? AppThemesBrightness.dark
                                                  : AppThemesBrightness.light,
                                            ),
                                          );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: context.theme.colorScheme.surface,
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Colors',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              ThemeGridBuilder(),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Positioned(
                left: 0,
                top: 0,
                child: AppBackButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

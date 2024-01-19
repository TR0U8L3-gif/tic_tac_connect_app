import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/manager/theme_changer_bloc.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/widgets/theme_grid_item.dart';

class ThemeGridBuilder extends StatelessWidget {
  const ThemeGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: AppThemes.getListNames().length,
        itemBuilder: (_, index) {
          return ThemeGridItem(
            color: AppThemes.getList()[index].color,
            onTap: () {
              context.read<ThemeChangerBloc>().add(
                    ThemeChangerChangeThemeEvent(
                      name: AppThemes.getListNames()[index],
                    ),
                  );
            },
          );
        });
  }
}

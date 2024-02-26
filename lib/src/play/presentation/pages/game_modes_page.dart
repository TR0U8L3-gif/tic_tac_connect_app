import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app/app_container.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app/app_scaffold.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';
import 'package:tic_tac_connect_app/src/play/presentation/pages/game_settings_page.dart';
import 'package:tic_tac_connect_app/src/play/presentation/pages/games/computer_game_page.dart';

@RoutePage()
class GameModesPage extends StatelessWidget {
  const GameModesPage({super.key});

  static const tabName = '';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadiusCircular),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lets Play',
                    style: TextStyle(
                      fontSize: kFontSizeLarge,
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onBackground,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                _tile(
                  context: context,
                  icon: Ionicons.game_controller,
                  gameMode: 'match',
                  definition: 'play with friends on one device',
                  onTap: () => context.router.pushNamed(GameSettingPage.tabName),
                ),
                _tile(
                  context: context,
                  icon: Ionicons.hardware_chip_outline,
                  gameMode: 'computer',
                  definition: 'play against a computer',
                  onTap: () =>
                      context.router.pushNamed(ComputerGamePage.tabName),
                ),
                _tile(
                  context: context,
                  icon: Ionicons.earth_outline,
                  gameMode: 'online',
                  definition: 'find matches on the Internet',
                  onTap: () {},
                ),
                _tile(
                  context: context,
                  icon: Ionicons.home_outline,
                  gameMode: 'offline',
                  definition: 'find local matches',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 24,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create Match',
                    style: TextStyle(
                      fontSize: kFontSizeLarge,
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onBackground,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                _tile(
                  context: context,
                  icon: Ionicons.earth_outline,
                  gameMode: 'online',
                  definition: 'private room on the Internet',
                  onTap: () {},
                ),
                _tile(
                  context: context,
                  icon: Ionicons.home_outline,
                  gameMode: 'offline',
                  definition: 'LAN or Bluetooth match',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tile({
    required BuildContext context,
    required IconData icon,
    required String gameMode,
    required String definition,
    required void Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(kBorderRadiusCircular),
        onTap: onTap,
        child: AppContainer(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 40,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    gameMode,
                    style: TextStyle(
                      fontSize: kFontSizeMedium,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onBackground,
                    ),
                  ),
                  Text(
                    definition,
                    style: const TextStyle(
                      fontSize: kFontSizeSmall,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),),
      ),
    );
  }
}

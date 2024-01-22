import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app_scaffold.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_board.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_circle.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac_cross.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';
import 'package:tic_tac_connect_app/src/play/presentation/widgets/settings_buttons.dart';
import 'package:tic_tac_connect_app/src/play/presentation/widgets/settings_page.dart';

@RoutePage()
class GameSettingPage extends StatelessWidget {
  const GameSettingPage({super.key});

  static const tabName = 'settings';

  @override
  Widget build(BuildContext context) {
    final boardKey = GlobalKey();
    final numbersKey = GlobalKey();
    final playersKey = GlobalKey();

    const padding = 24.0;

    return AppScaffold(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kBorderRadiusCircular),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SettingsPage(
                    key: boardKey,
                    padding: padding,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Board',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: kFontSizeLarge,
                                    color:
                                        context.theme.colorScheme.onBackground,
                                  ),
                                ),
                                const Text(
                                  'set playable board size',
                                  style: TextStyle(
                                    fontSize: kFontSizeSmall,
                                    color: Colors.grey,
                                    height: 0.8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          child: TicTacBoard(
                            boardSize: constraints.maxWidth,
                            lineSize: 12,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SettingsButtons(
                            previousKey: null,
                            nextKey: numbersKey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SettingsPage(
                    key: numbersKey,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    padding: padding,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Some Numbers',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: kFontSizeLarge,
                                        color: context
                                            .theme.colorScheme.onBackground,
                                      ),
                                    ),
                                    const Text(
                                      'set number of players',
                                      style: TextStyle(
                                        fontSize: kFontSizeSmall,
                                        color: Colors.grey,
                                        height: 0.8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'More Numbers',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: kFontSizeLarge,
                                        color: context
                                            .theme.colorScheme.onBackground,
                                      ),
                                    ),
                                    const Text(
                                      'set connect variable',
                                      style: TextStyle(
                                        fontSize: kFontSizeSmall,
                                        color: Colors.grey,
                                        height: 0.8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SettingsButtons(
                            previousKey: boardKey,
                            nextKey: playersKey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SettingsPage(
                    key: playersKey,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    padding: padding,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Players',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: kFontSizeLarge,
                                    color:
                                        context.theme.colorScheme.onBackground,
                                  ),
                                ),
                                const Text(
                                  'set or randomize the order of playing the games',
                                  style: TextStyle(
                                    fontSize: kFontSizeSmall,
                                    color: Colors.grey,
                                    height: 0.8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TicTacCross(
                                  size: constraints.maxWidth / 2, lineWidth: 12),
                              TicTacCircle(
                                  size: constraints.maxWidth / 2, lineWidth: 12),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SettingsButtons(
                            previousKey: numbersKey,
                            nextKey: null,
                            next: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

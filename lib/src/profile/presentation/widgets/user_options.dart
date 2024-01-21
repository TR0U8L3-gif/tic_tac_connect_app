import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tic_tac_connect_app/core/common/presentation/views/loading_page.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app_container.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/tutorial_page.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/pages/theme_page.dart';

class UserOptions extends StatelessWidget {
  const UserOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: AppContainer(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'user options',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: kFontSizeSmall,
                  height: 0.8,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            _tile(
              context: context,
              icon: Ionicons.id_card_outline,
              title: 'profile',
              onTap: () {},
            ),
            _tile(
              context: context,
              icon: Ionicons.color_palette_outline,
              title: 'theme',
              onTap: () => context.router.pushNamed(ThemePage.tabName),
            ),
            _tile(
              context: context,
              icon: Ionicons.map_outline,
              title: 'tutorial',
              onTap: () => context.router.pushNamed(TutorialPage.routeName),
            ),
            _tile(
              context: context,
              icon: Ionicons.settings_outline,
              title: 'settings',
              onTap: () {},
            ),
            _tile(
              context: context,
              icon: Ionicons.alert_circle_outline,
              title: 'report problem',
              onTap: () {},
            ),
            _tile(
              context: context,
              icon: Ionicons.help_circle_outline,
              title: 'help',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoadingPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required void Function() onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(kBorderRadiusCircular),
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: kFontSizeMedium,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onBackground,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

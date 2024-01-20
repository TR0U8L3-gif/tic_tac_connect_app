import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app_container.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class UserStatistics extends StatelessWidget {
  const UserStatistics({super.key});

  static const kGapSize = 12.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _tile(context: context),
          const SizedBox(
            width: kGapSize,
          ),
          _tile(context: context),
          const SizedBox(
            width: kGapSize,
          ),
          _tile(context: context),
          const SizedBox(
            width: kGapSize,
          ),
          _tile(context: context),
        ],
      ),
    );
  }

  Widget _tile({
    required BuildContext context,
  }) {
    return Expanded(
      child: AppContainer(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Icon(
                  Ionicons.stats_chart_outline,
                ),
                Text(
                  'Type',
                  style: TextStyle(
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
              ],
            ),
            Text(
              'Data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

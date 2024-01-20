import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app_scaffold.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/src/profile/presentation/widgets/user_options.dart';
import 'package:tic_tac_connect_app/src/profile/presentation/widgets/user_profile.dart';
import 'package:tic_tac_connect_app/src/profile/presentation/widgets/user_statistics.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const tabName = '';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Align(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadiusCircular),
          child: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UserProfile(),
                UserStatistics(),
                UserOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

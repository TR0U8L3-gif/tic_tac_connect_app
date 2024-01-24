import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  static const kUserProfileRadius = 48.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadiusCircular),
        color: context.theme.colorScheme.surface,
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        height: kUserProfileRadius * 2,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.all(Radius.circular(kUserProfileRadius)),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.colorScheme.primary,
                  ),
                  width: kUserProfileRadius * 2,
                  height: kUserProfileRadius * 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          height: 0.9,
                          color: context.theme.colorScheme.onBackground,
                        ),
                      ),
                      const Text(
                        ' HJGSD7238NDSH',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: kFontSizeSmall,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Joined: Nov 24 2022',
                    style: TextStyle(
                      fontSize: kFontSizeSmall,
                      color: context.theme.colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

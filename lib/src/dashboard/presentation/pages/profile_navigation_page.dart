import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileNavigationPage extends StatelessWidget {
  const ProfileNavigationPage({super.key});

  static const String tabName = 'profile';

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

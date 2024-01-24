import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app_scaffold.dart';

@RoutePage()
class MatchGamePage extends StatefulWidget {
  const MatchGamePage({super.key});

  static const routeName = '/match';
  static const pathName = 'match';
  @override
  State<MatchGamePage> createState() => _MatchGamePageState();
}

class _MatchGamePageState extends State<MatchGamePage> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      child: Align(
        child: Text('Match'),
      ),
    );
  }
}

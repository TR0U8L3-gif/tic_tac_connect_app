import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app/app_scaffold.dart';

@RoutePage()
class ComputerGamePage extends StatefulWidget {
  const ComputerGamePage({super.key});

  static const routeName = '/computer';
  static const tabName = 'computer';

  @override
  State<ComputerGamePage> createState() => _ComputerGamePageState();
}

class _ComputerGamePageState extends State<ComputerGamePage> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      child: Align(
        child: Text('Computer'),
      ),
    );
  }
}

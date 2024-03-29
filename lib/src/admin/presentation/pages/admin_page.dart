import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/views/loading_page.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app/app_scaffold.dart';
import 'package:tic_tac_connect_app/src/admin/presentation/widgets/board_page.dart';
import 'package:tic_tac_connect_app/src/admin/presentation/widgets/interactive_board_page.dart';

@RoutePage()
class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  static const tabName = 'admin';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute<dynamic> (
              builder: (BuildContext context) => const LoadingPage(),
            ),),
            title: const Text('Loading Page'),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute<dynamic> (
              builder: (BuildContext context) => const InteractiveBoardPage(),
            ),),
            title: const Text('Interactive Board Page'),
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute<dynamic> (
              builder: (BuildContext context) => const BoardPage(),
            ),),
            title: const Text('Board Page'),
          ),
        ],
      ),
    );
  }
}

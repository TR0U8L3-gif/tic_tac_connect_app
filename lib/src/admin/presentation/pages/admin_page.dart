import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/common/presentation/views/loading_page.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app_scaffold.dart';

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
            onTap: () => Navigator.push(context, MaterialPageRoute (
              builder: (BuildContext context) => const LoadingPage(),
            ),),
            title: const Text('Loading Page'),
          ),
        ],
      ),
    );
  }
}

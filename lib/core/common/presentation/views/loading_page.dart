import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: context.width * 0.4,
            height: context.width * 0.4,
            child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

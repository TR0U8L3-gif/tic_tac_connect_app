import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_connect_app/core/services/dependency_injection/injection_container.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/manager/on_boarding_bloc.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/widgets/on_boarding_body.dart';

@RoutePage()
class TutorialPage extends StatefulWidget implements AutoRouteWrapper {
  const TutorialPage({super.key});

  static const String routeName = '/tutorial';

  @override
  State<TutorialPage> createState() => _TutorialPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OnBoardingBloc>(),
      child: this,
    );
  }
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    return const OnBoardingBody();
  }
}

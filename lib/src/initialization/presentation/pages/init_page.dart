import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/app/app_scaffold.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_board.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_circle.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_cross.dart';
import 'package:tic_tac_connect_app/core/common/presentation/widgets/tic_tac/tic_tac_line.dart';
import 'package:tic_tac_connect_app/core/common/providers/init_provider.dart';
import 'package:tic_tac_connect_app/core/services/dependency_injection/injection_container.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/dashboard_page.dart';
import 'package:tic_tac_connect_app/src/initialization/presentation/manager/init_bloc.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/manager/on_boarding_bloc.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/manager/theme_changer_bloc.dart';

@RoutePage()
class InitPage extends StatefulWidget implements AutoRouteWrapper {
  const InitPage({super.key});

  static const routeName = '/';

  @override
  State<InitPage> createState() => _InitPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<OnBoardingBloc>()
            ..add(const ShowOnBoardingEvent(checkIfFirstTimer: true)),
        ),
        BlocProvider(
          create: (context) => sl<InitBloc>(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => InitProvider(
          initialization: {
            context.read<ThemeChangerBloc>(): ThemeChangerLoadedState,
            context.read<OnBoardingBloc>(): OnBoardingStatusState,
          },
        ),
        child: this,
      ),
    );
  }
}

class _InitPageState extends State<InitPage> with TickerProviderStateMixin {

  bool isAnimationCompleted = false;
  final lineSize = 12.0;

  late AnimationController _loadingController;
  late AnimationController _appearController;
  late AnimationController _crossController;

  @override
  void initState() {
    super.initState();

    _loadingController = AnimationController(
      vsync: this,
      duration: kDuration200,
    );
    _appearController = AnimationController(
      vsync: this,
      duration: kDuration200,
    );
    _crossController = AnimationController(
      vsync: this,
      duration: kDuration200,
    );
    _loadingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _appearController.forward();
      }
    });
    _appearController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future<void>.delayed(kDuration200);
        await _crossController.forward();
      }

    });

    _crossController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        setState(() {
          isAnimationCompleted = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<InitBloc>();
    final provider = context.watch<InitProvider>();
    final onBoardingBloc = context.read<OnBoardingBloc>();
    final router = context.router;

    if (bloc.state is InitLoadingState && provider.initialized) {
      bloc.add(const InitLoadingEndedEvent());
    }

    if (bloc.state is InitAnimatingState && isAnimationCompleted) {
      bloc.add(const InitAnimationEndedEvent());
    }

    return BlocConsumer<InitBloc, InitState>(
      listener: (context, state) async {
        if (state is InitAnimatingState) {
          //TO DO Fake loading
          await Future<void>.delayed(const Duration(seconds: 1));
          await _loadingController.forward();
        }
        if (state is InitEndedState) {
          if (onBoardingBloc.state ==
              const OnBoardingStatusState(isFirstTimer: true)) {
            await router.replaceNamed(OnBoardingPage.routeName);
          } else {
            await router.replaceNamed(DashboardPage.routeName);
          }
        }
      },
      builder: (context, state) {
        return AppScaffold(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final boardSize =
                  min(constraints.maxWidth, constraints.maxHeight);
              return Center(
                child: SizedBox(
                  width: boardSize,
                  height: boardSize,
                  child: Stack(
                    children: [
                      TicTacBoard(boardSize: boardSize, lineSize: lineSize),
                      Align(
                        child: SizedBox(
                          width: boardSize / 3,
                          height: boardSize / 3,
                          child: Padding(
                            padding: EdgeInsets.all(lineSize),
                            child: AnimatedBuilder(
                              animation: _loadingController,
                              builder: (context, _) {
                                return CircularProgressIndicator(
                                  strokeWidth: lineSize,
                                  backgroundColor: context
                                      .theme.colorScheme.primary
                                      .withOpacity(0.6),
                                  strokeCap: StrokeCap.round,
                                  strokeAlign: -1,
                                  value: _loadingController.value <= 0
                                      ? null
                                      : _loadingController.value,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TicTacCircle(
                          size: boardSize / 3,
                          lineWidth: lineSize,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TicTacCross(
                          size: boardSize / 3,
                          lineWidth: lineSize,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: TicTacCross(
                          size: boardSize / 3,
                          lineWidth: lineSize,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: AnimatedBuilder(
                          animation: _appearController,
                          builder: (context, _) {
                            return Opacity(
                              opacity: _appearController.value,
                              child: TicTacCircle(
                                size: boardSize / 3,
                                lineWidth: lineSize,
                              ),
                            );
                          },
                        ),
                      ),
                      OverflowBox(
                        maxHeight: boardSize * sqrt2,
                        maxWidth: boardSize * sqrt2,
                        alignment: Alignment.topLeft,
                        child: Transform.translate(
                          offset: Offset(-lineSize * 0.5, 0),
                          child: Transform.rotate(
                            angle: pi * -0.25,
                            alignment: Alignment.topCenter,
                            child: AnimatedBuilder(
                              animation: _crossController,
                              builder: (context, _) {
                                return TicTacLine(
                                  width: lineSize,
                                  height: boardSize *
                                      sqrt2 *
                                      _crossController.value,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

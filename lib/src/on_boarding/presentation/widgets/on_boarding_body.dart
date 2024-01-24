import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tic_tac_connect_app/core/common/presentation/views/loading_page.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/core/utils/enums.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';
import 'package:tic_tac_connect_app/src/dashboard/presentation/pages/dashboard_page.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/entities/page_content.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/manager/on_boarding_bloc.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/widgets/on_boarding_tile.dart';

const kDotsAlignment = 0.6;
const kDotsHeight = 48.0;
const kButtonAlignment = 0.04;
const kButtonHeight = 64.0;

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final pageController = PageController();
  late bool isOnBoarding;
  bool isFinalPage = false;

  @override
  void initState() {
    super.initState();
    isOnBoarding = context.router.currentPath == OnBoardingPage.routeName;
    final bloc = context.read<OnBoardingBloc>();
    if (!isOnBoarding) {
      bloc.add(ShowOnBoardingEvent(checkIfFirstTimer: isOnBoarding));
      return;
    }
    if (bloc.state is OnBoardingStatusState) {
      return;
    }
    bloc.add(
      ShowOnBoardingEvent(
        checkIfFirstTimer: isOnBoarding,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnBoardingBloc, OnBoardingState>(
        listener: (BuildContext context, OnBoardingState state) {
          if (state is OnBoardingFirstTimerCachedState) {
            if (!isOnBoarding) {
              context.router.popUntilRouteWithPath(DashboardPage.routeName);
            } else {
              context.router.replaceNamed(DashboardPage.routeName);
            }
          }
        },
        builder: (BuildContext context, OnBoardingState state) {
          if (state is OnBoardingLoadingState) {
            return const LoadingPage();
          }
          return SafeArea(
            child: LayoutBuilder(
              builder: (context, constrains) {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      children: [
                        OnBoardingTile(
                          wight: constrains.maxWidth,
                          height: constrains.maxHeight,
                          pageContent: PageContent.page(
                            pagePosition: PageContentEnum.first,
                          ),
                        ),
                        OnBoardingTile(
                          wight: constrains.maxWidth,
                          height: constrains.maxHeight,
                          pageContent: PageContent.page(
                            pagePosition: PageContentEnum.second,
                          ),
                        ),
                        OnBoardingTile(
                          wight: constrains.maxWidth,
                          height: constrains.maxHeight,
                          pageContent: PageContent.page(
                            pagePosition: PageContentEnum.third,
                          ),
                        ),
                        OnBoardingTile(
                          wight: constrains.maxWidth,
                          height: constrains.maxHeight,
                          pageContent: PageContent.page(
                            pagePosition: PageContentEnum.fourth,
                          ),
                        ),
                      ],
                      onPageChanged: (page) => setState(() {
                        isFinalPage = page == PageContentEnum.values.length - 1;
                      }),
                    ),
                    Positioned(
                      top: constrains.maxHeight * kDotsAlignment,
                      child: SizedBox(
                        height: kDotsHeight,
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: PageContentEnum.values.length,
                          onDotClicked: (index) {
                            pageController.animateToPage(
                              index,
                              duration: kDuration600,
                              curve: Curves.easeInOut,
                            );
                          },
                          effect: WormEffect(
                            dotHeight: 12,
                            dotWidth: 12,
                            spacing: 48,
                            activeDotColor: context.theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: constrains.maxHeight * kButtonAlignment,
                      child: Container(
                        alignment: Alignment.center,
                        height: kButtonHeight,
                        child: (state is! OnBoardingCachingFirstTimerState)
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(context.width * 0.64, 48),
                                  backgroundColor: context
                                      .theme.colorScheme.primary
                                      .withOpacity(isFinalPage ? 1 : 0.8),
                                  foregroundColor:
                                      context.theme.colorScheme.background,
                                ),
                                onPressed: () {
                                  if (isFinalPage) {
                                    context.read<OnBoardingBloc>().add(
                                          const CacheFirstTimerEvent(),
                                        );
                                  } else {
                                    pageController.nextPage(
                                      duration: kDuration600,
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Text(
                                  isFinalPage ? 'Get Started' : 'Next',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : const CircularProgressIndicator(),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

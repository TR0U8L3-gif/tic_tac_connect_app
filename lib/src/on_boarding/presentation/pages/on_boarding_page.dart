import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tic_tac_connect_app/core/common/presentation/views/loading_page.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/entities/page_content.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/manager/on_boarding_bloc.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/widgets/on_boarding_body.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = '/on-boarding';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<OnBoardingBloc>().add(const CheckIfFirstTimerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnBoardingBloc, OnBoardingState>(
        listener: (BuildContext context, OnBoardingState state) {},
        builder: (BuildContext context, OnBoardingState state) {
          if (state is OnBoardingStatusState && state.isFirstTimer) {
            return Stack(
              children: [
                PageView(
                  controller: pageController,
                  children: [
                    OnBoardingBody(
                      pageContent: PageContent.page(
                        pagePosition: PageContentEnum.first,
                      ),
                    ),
                    OnBoardingBody(
                      pageContent: PageContent.page(
                        pagePosition: PageContentEnum.second,
                      ),
                    ),
                    OnBoardingBody(
                      pageContent: PageContent.page(
                        pagePosition: PageContentEnum.third,
                      ),
                    ),
                    OnBoardingBody(
                      pageContent: PageContent.page(
                        pagePosition: PageContentEnum.fourth,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const Alignment(0, .04),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    onDotClicked: (index) {
                      pageController.animateToPage(
                        index,
                        duration: const Duration(
                          milliseconds: 400,
                        ),
                        curve: Curves.easeInOut,
                      );
                    },
                    effect: WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      spacing: 48,
                      activeDotColor: context.theme.primaryColor,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 18,
                    ),
                  ),
                  onPressed: () {
                    if (pageController.page ==
                        PageContentEnum.values.length - 1) {
                      context.read<OnBoardingBloc>().add(
                            const CacheFirstTimerEvent(),
                          );
                    } else {
                      pageController.nextPage(
                        duration: duration200,
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    (pageController.page == PageContentEnum.values.length - 1)
                        ? 'Get Started'
                        : 'Next',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          }
          return const LoadingPage();
        },
      ),
    );
  }
}

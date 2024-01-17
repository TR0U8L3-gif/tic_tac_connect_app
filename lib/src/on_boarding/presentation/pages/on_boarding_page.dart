import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tic_tac_connect_app/core/common/presentation/views/loading_page.dart';
import 'package:tic_tac_connect_app/core/services/dependency_injection/injection_container.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/entities/page_content.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/manager/on_boarding_bloc.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/widgets/on_boarding_body.dart';


const kDotsAlignment = 0.6;
const kDotsHeight = 48.0;
const kButtonAlignment = 0.04;
const kButtonHeight = 64.0;

@RoutePage()
class OnBoardingPage extends StatefulWidget implements AutoRouteWrapper {
  const OnBoardingPage({super.key});

  static const String routeName = '/on-boarding';

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OnBoardingBloc>(),
      child: this,
    );
  }
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final pageController = PageController();
  bool isFinalPage = false;

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
            return SafeArea(
              child: LayoutBuilder(
                builder: (context, constrains) {
                  return Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      PageView(
                        controller: pageController,
                        children: [
                          OnBoardingBody(
                            wight: constrains.maxWidth,
                            height: constrains.maxHeight,
                           pageContent: PageContent.page(
                              pagePosition: PageContentEnum.first,
                            ),
                          ),
                          OnBoardingBody(
                            wight: constrains.maxWidth,
                            height: constrains.maxHeight,
                            pageContent: PageContent.page(
                              pagePosition: PageContentEnum.second,
                            ),
                          ),
                          OnBoardingBody(
                            wight: constrains.maxWidth,
                            height: constrains.maxHeight,
                            pageContent: PageContent.page(
                              pagePosition: PageContentEnum.third,
                            ),
                          ),
                          OnBoardingBody(
                            wight: constrains.maxWidth,
                            height: constrains.maxHeight,
                            pageContent: PageContent.page(
                              pagePosition: PageContentEnum.fourth,
                            ),
                          ),

                        ],
                        onPageChanged: (page) =>
                            setState(() {
                              isFinalPage =
                                  page == PageContentEnum.values.length - 1;
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
                                duration: duration600,
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
                      ),
                      Positioned(
                        bottom: constrains.maxHeight * kButtonAlignment,
                        child: Container(
                          alignment: Alignment.center,
                          height: kButtonHeight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(context.width * 0.64, 48),
                              backgroundColor: isFinalPage
                                  ? context.theme.primaryColor
                                  : context.theme.primaryColor.withOpacity(0.8),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              if (isFinalPage) {
                                context.read<OnBoardingBloc>().add(
                                  const CacheFirstTimerEvent(),
                                );
                              } else {
                                pageController.nextPage(
                                  duration: duration600,
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Text(
                              isFinalPage
                                  ? 'Get Started'
                                  : 'Next',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
          return const LoadingPage();
        },
      ),
    );
  }
}
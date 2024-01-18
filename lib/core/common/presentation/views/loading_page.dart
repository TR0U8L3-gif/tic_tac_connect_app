import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  static const kLineSize = 12.0;
  static const kSizeFactor = 0.8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: context.width * kSizeFactor,
          height: context.width * kSizeFactor,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _line(
                    context: context,
                    width: double.infinity,
                    height: kLineSize,
                  ),
                  _line(
                    context: context,
                    width: double.infinity,
                    height: kLineSize,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _line(
                    context: context,
                    width: kLineSize,
                    height: double.infinity,
                  ),
                  _line(
                    context: context,
                    width: kLineSize,
                    height: double.infinity,
                  ),
                ],
              ),
              Align(
                child: SizedBox(
                  width: context.width * kSizeFactor / 3,
                  height: context.width * kSizeFactor / 3,
                  child: Padding(
                    padding: const EdgeInsets.all(kLineSize),
                    child: CircularProgressIndicator(
                      strokeWidth: kLineSize * kSizeFactor,
                      backgroundColor:
                          context.theme.primaryColor.withOpacity(0.4),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _line({
    required BuildContext context,
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

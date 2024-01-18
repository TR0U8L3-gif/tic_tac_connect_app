import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/entities/page_content.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/widgets/on_boarding_body.dart';

class OnBoardingTile extends StatelessWidget {
  const OnBoardingTile({
    required this.pageContent,
    required this.wight,
    required this.height,
    super.key,
  });

  final double wight;
  final double height;
  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wight,
      height: height,
      child: Column(
        children: [
          SizedBox(
            width: wight,
            height: height * kDotsAlignment,
            child: () {
              if (pageContent.imageUrl == null) {
                return SizedBox(
                  height: context.height * 0.4,
                  child: const Placeholder(),
                );
              } else {
                return Image.asset(
                  pageContent.imageUrl!,
                  height: context.height * 0.4,
                );
              }
            }(),
          ),
          const SizedBox(
            height: kDotsHeight,
          ),
          Expanded(
            child: Container(
              width: wight,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    pageContent.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Text(
                    pageContent.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: kButtonHeight,
          ),
          SizedBox(
            width: wight,
            height: kButtonAlignment * height,
          ),
        ],
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       if (pageContent.imageUrl == null)
//         SizedBox(
//           height: context.height * 0.4,
//           child: const Placeholder(),
//         )
//       else
//         Image.asset(
//           pageContent.imageUrl!,
//           height: context.height * 0.4,
//         ),
//       SizedBox(
//         height: context.height * 0.03,
//       ),
//       Padding(
//         padding: const EdgeInsets.all(20).copyWith(bottom: 0),
//         child: Column(
//           children: [
//             Text(
//               pageContent.title,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: context.height * 0.02,
//             ),
//             Text(
//               pageContent.description,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 24,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }
}

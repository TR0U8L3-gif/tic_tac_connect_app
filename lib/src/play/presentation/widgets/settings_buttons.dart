import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/core/utils/extensions/context_extension.dart';

class SettingsButtons extends StatelessWidget {
  const SettingsButtons({
    required GlobalKey? previousKey,
    required GlobalKey? nextKey,
    void Function()? next,
    super.key,
  })  : _previousKey = previousKey,
        _nextKey = nextKey,
        _next = next;

  final GlobalKey? _previousKey;
  final GlobalKey? _nextKey;
  final void Function()? _next;

  @override
  Widget build(BuildContext context) {
    const kHeight = 48.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: InkWell(
        onTap: _next ??
            () {
              Scrollable.ensureVisible(
                _nextKey!.currentContext!,
                duration: kDuration400,
              );
            },
        borderRadius: BorderRadius.circular(kBorderRadiusCircular),
        child: Container(
          height: kHeight,
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadiusCircular),
            color: context.theme.colorScheme.primaryContainer,
          ),
          child: Stack(
            children: [
              Align(
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: context.theme.colorScheme.onBackground,
                    fontSize: kFontSizeMedium,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (_previousKey != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Scrollable.ensureVisible(
                        _previousKey.currentContext!,
                        duration: kDuration400,
                      );
                    },
                    borderRadius: BorderRadius.circular(kBorderRadiusCircular),
                    child: Container(
                      width: kHeight,
                      height: kHeight,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(kBorderRadiusCircular),
                        color: context.theme.colorScheme.secondaryContainer,
                      ),
                      child: const Icon(
                        Ionicons.arrow_up_outline,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

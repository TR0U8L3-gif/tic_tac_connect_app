import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    this.navBarEssentials = const NavBarEssentials(items: null),
    super.key,
  });

  final NavBarEssentials? navBarEssentials;

  Widget _buildItem(
    PersistentBottomNavBarItem item,
    bool isSelected,
    double? height,
  ) =>
      navBarEssentials!.navBarHeight == 0
          ? const SizedBox.shrink()
          : AnimatedContainer(
              width: isSelected ? 120 : 50,
              height: height! / 1.5,
              duration: navBarEssentials!.itemAnimationProperties?.duration ??
                  const Duration(milliseconds: 400),
              curve: navBarEssentials!.itemAnimationProperties?.curve ??
                  Curves.ease,
              padding: EdgeInsets.all(item.contentPadding),
              decoration: BoxDecoration(
                color: isSelected
                    ? item.activeColorPrimary.withOpacity(0.15)
                    : navBarEssentials!.backgroundColor!.withOpacity(0),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Container(
                alignment: Alignment.center,
                height: height / 1.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: IconTheme(
                        data: IconThemeData(
                          size: item.iconSize,
                          color: isSelected
                              ? (item.activeColorSecondary ??
                                  item.activeColorPrimary)
                              : item.inactiveColorPrimary ??
                                  item.activeColorPrimary,
                        ),
                        child: isSelected
                            ? item.icon
                            : item.inactiveIcon ?? item.icon,
                      ),
                    ),
                    if (item.title == null)
                      const SizedBox.shrink()
                    else
                      isSelected
                          ? Flexible(
                              child: Material(
                                type: MaterialType.transparency,
                                child: FittedBox(
                                  child: Text(
                                    item.title!,
                                    style: item.textStyle != null
                                        ? (item.textStyle!.apply(
                                            color: isSelected
                                                ? (item.activeColorSecondary ??
                                                    item.activeColorPrimary)
                                                : item.inactiveColorPrimary,
                                          ))
                                        : TextStyle(
                                            color: item.activeColorSecondary ??
                                                item.activeColorPrimary,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                  ],
                ),
              ),
            );

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: navBarEssentials!.navBarHeight,
        padding: EdgeInsets.only(
          top: navBarEssentials!.padding?.top ??
              navBarEssentials!.navBarHeight! * 0.15,
          left: navBarEssentials!.padding?.left ??
              MediaQuery.of(context).size.width * 0.07,
          right: navBarEssentials!.padding?.right ??
              MediaQuery.of(context).size.width * 0.07,
          bottom: navBarEssentials!.padding?.bottom ??
              navBarEssentials!.navBarHeight! * 0.15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: navBarEssentials!.items!.map((item) {
            final index = navBarEssentials!.items!.indexOf(item);
            return Flexible(
              flex: navBarEssentials!.selectedIndex == index ? 2 : 1,
              child: GestureDetector(
                onTap: () {
                  if (navBarEssentials!.items![index].onPressed != null) {
                    navBarEssentials!.items![index].onPressed!(
                      navBarEssentials!.selectedScreenBuildContext,
                    );
                  } else {
                    navBarEssentials!.onItemSelected!(index);
                  }
                },
                child: ColoredBox(
                  color: Colors.transparent,
                  child: _buildItem(
                    item,
                    navBarEssentials!.selectedIndex == index,
                    navBarEssentials!.navBarHeight,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
}

class NavBarEssentials {
  const NavBarEssentials({
    required this.items,
    this.selectedIndex,
    this.previousIndex,
    this.backgroundColor,
    this.popScreensOnTapOfSelectedTab,
    this.popAllScreensOnTapAnyTabs,
    this.itemAnimationProperties,
    this.navBarHeight = 0.0,
    this.onItemSelected,
    this.padding,
    this.selectedScreenBuildContext,
  });

  final int? selectedIndex;
  final int? previousIndex;
  final Color? backgroundColor;
  final List<PersistentBottomNavBarItem>? items;
  final ValueChanged<int>? onItemSelected;
  final double? navBarHeight;
  final NavBarPadding? padding;
  final bool? popScreensOnTapOfSelectedTab;
  final bool? popAllScreensOnTapAnyTabs;
  final ItemAnimationProperties? itemAnimationProperties;
  final BuildContext? selectedScreenBuildContext;
}

///An item widget for the `PersistentTabView`.
class PersistentBottomNavBarItem {
  PersistentBottomNavBarItem({
    required this.icon,
    this.inactiveIcon,
    this.title,
    this.contentPadding = 5.0,
    this.activeColorPrimary = CupertinoColors.activeBlue,
    this.activeColorSecondary,
    this.inactiveColorPrimary,
    this.inactiveColorSecondary = CupertinoColors.systemGrey,
    this.opacity = 1.0,
    this.filter,
    this.textStyle,
    this.iconSize = 26.0,
    this.onSelectedTabPressWhenNoScreensPushed,
    this.onPressed,
  }) : assert(
          opacity >= 0 && opacity <= 1.0,
          'Opacity cannot be greater than 1 and less than 0',
        );

  ///Icon for the bar item.
  final Widget icon;

  ///In-Active icon for the bar item.
  final Widget? inactiveIcon;

  ///Title for the bar item. Might not appear is some `styles`.
  final String? title;

  ///Color for the current selected item in the navigation bar.
  ///If `activeColorSecondary` property is empty, this will act in its place
  ///(recommended). `cupertino activeBlue` by default.
  final Color activeColorPrimary;

  ///Color for the unselected item(s) in the navigation bar.
  final Color? inactiveColorPrimary;

  ///Color for the item's `icon` and `title`. In most styles, declaring
  /// the `activeColorPrimary` will be enough. But in some styles
  /// like `style7`, this might come help in differentiating the colors.
  final Color? activeColorSecondary;

  ///Color for the item's `inactiveIcon` and `title`. In most styles,
  ///declaring the the `inactiveColorPrimary` will be enough.
  ///But in some styles like `style7`, this might come help in
  ///differentiating the colors.
  final Color inactiveColorSecondary;

  ///Padding of the navigation bar item. Applies on all sides. `5.0` by default.
  ///
  ///`USE WITH CAUTION, MAY BREAK THE NAV BAR`.
  final double contentPadding;

  ///Enables and controls the transparency effect of the entire NavBar
  ///when this tab is selected.
  ///
  ///`Warning: Screen will cover the entire extent of the display`
  final double opacity;

  ///If you want custom behavior on a press of a NavBar item like display
  ///a modal screen, you can declare your logic here.
  ///
  ///NOTE: This will override the default tab switiching behavior
  ///for this particular item.
  final void Function(BuildContext?)? onPressed;

  ///Use it when you want to run some code when user presses the NavBar when
  ///on the initial screen of that respective tab. The inspiration was taken
  ///from the native iOS navigation bar behavior where when performing similar
  ///operation, you taken to the top of the list.
  ///
  ///NOTE: This feature is experimental at the moment and might not work
  ///as intended for some.
  final VoidCallback? onSelectedTabPressWhenNoScreensPushed;

  ///Filter used when `opacity < 1.0`. Can be used to
  ///create 'frosted glass' effect.
  ///
  ///By default -> `ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0)`.
  final ImageFilter? filter;

  ///`TextStyle` of the title's text.
  final TextStyle? textStyle;

  final double iconSize;
}

class NavBarPadding {
  const NavBarPadding.only({this.top, this.bottom, this.right, this.left});

  const NavBarPadding.symmetric({
    double? horizontal,
    double? vertical,
  })  : top = vertical,
        bottom = vertical,
        right = horizontal,
        left = horizontal;

  const NavBarPadding.all(double? value)
      : top = value,
        bottom = value,
        right = value,
        left = value;

  const NavBarPadding.fromLTRB(this.top, this.bottom, this.right, this.left);

  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
}

class ItemAnimationProperties {
  const ItemAnimationProperties({this.duration, this.curve});
  final Duration? duration;
  final Curve? curve;
}
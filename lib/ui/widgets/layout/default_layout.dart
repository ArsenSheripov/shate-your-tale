import 'package:flutter/material.dart';
import 'package:share_your_tale/ui/ui.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    this.appBar,
    super.key,
    this.body,
    this.paddingTopValue = 0,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.paddingHorizontalValue,
    this.paddingBottomValue,
    this.safeAreaBottom = true,
    this.bottomBarWithPadding = false,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final double paddingTopValue;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final double? paddingHorizontalValue;
  final double? paddingBottomValue;
  final bool safeAreaBottom;
  final bool bottomBarWithPadding;

  @override
  Widget build(BuildContext context) {
    const bottomPadding = defaultPaddingValue;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: SafeArea(
        bottom: safeAreaBottom,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            paddingHorizontalValue ?? defaultPaddingValue,
            paddingTopValue,
            paddingHorizontalValue ?? defaultPaddingValue,
            paddingBottomValue ?? bottomPadding,
          ),
          child: body,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar != null
          ? Padding(
              padding: EdgeInsets.fromLTRB(
                bottomBarWithPadding
                    ? paddingHorizontalValue ?? defaultPaddingValue
                    : 0,
                0,
                bottomBarWithPadding
                    ? paddingHorizontalValue ?? defaultPaddingValue
                    : 0,
                bottomBarWithPadding ? paddingBottomValue ?? bottomPadding : 0,
              ),
              child: bottomNavigationBar,
            )
          : null,
    );
  }
}

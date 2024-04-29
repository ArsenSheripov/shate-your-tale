import 'package:flutter/widgets.dart';
import 'package:share_your_tale/core/utils/extensions/context_extension.dart';
import 'package:share_your_tale/ui/core/theme.dart';

@immutable
class AppThemeScope extends InheritedWidget {
  const AppThemeScope({
    required super.child,
    required this.theme,
    super.key,
  });

  final AppTheme theme;

  static AppTheme of(
    BuildContext context, {
    bool listen = true,
  }) {
    return context.inhOf<AppThemeScope>(listen: listen).theme;
  }

  @override
  bool updateShouldNotify(covariant AppThemeScope oldWidget) => false;
}

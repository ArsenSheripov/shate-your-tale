import 'package:flutter/material.dart';
import 'package:share_your_tale/ui/core/theme_scope.dart';
import 'package:share_your_tale/ui/widgets/app_circular_progress_indicator/app_circular_progress_indicator.dart';

import 'package:share_your_tale/ui/widgets/buttons/base_button.dart';

class PrimaryButton extends BaseButton {
  const PrimaryButton({
    required super.onPressed,
    required super.text,
    super.iconPosition,
    super.isLoading,
    super.icon,
    super.key,
  });

  @override
  ButtonStyle getButtonStyle(BuildContext context, {required bool isLoading}) {
    final theme = AppThemeScope.of(context);

    return ButtonStyle(
      minimumSize: const MaterialStatePropertyAll(Size.fromHeight(48)),
      overlayColor: MaterialStatePropertyAll(
        theme.color.priamryPressed,
      ),
      textStyle: MaterialStatePropertyAll(
        theme.typography.body2.copyWith(color: theme.color.grayscale10),
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled) && !isLoading) {
            return theme.color.grayscale30;
          }

          return theme.color.primaryDefault;
        },
      ),
    );
  }

  @override
  Widget getProgressIndicator(
    BuildContext context,
  ) {
    final color = AppThemeScope.of(context).color.grayscale10;
    final backgroundColor = Colors.white.withOpacity(0.2);

    return AppCircularProgressIndicator(
      backgroundColor: backgroundColor,
      color: color,
    );
  }
}

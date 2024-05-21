import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:share_your_tale/ui/ui.dart';

abstract class BaseButton extends StatelessWidget {
  const BaseButton({
    required this.onPressed,
    required this.text,
    this.icon,
    this.isLoading = false,
    this.iconPosition = ButtonIconPosition.left,
    super.key,
  }) : child = null;

  const BaseButton.withChild({
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    super.key,
  })  : icon = null,
        iconPosition = ButtonIconPosition.left,
        text = null;

  final VoidCallback? onPressed;
  final bool isLoading;
  final String? text;
  final Widget? icon;
  final ButtonIconPosition iconPosition;
  final Widget? child;

  static const _sizeBetweenIconAndText = SizedBox(width: 8);

  static const _baseStyle = ButtonStyle(
    side: MaterialStatePropertyAll(BorderSide.none),
    elevation: MaterialStatePropertyAll(0),
  );

  @protected
  ButtonStyle getButtonStyle(BuildContext context, {required bool isLoading});

  @protected
  Widget getProgressIndicator(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final content = child ?? _createContent();

    return ElevatedButton(
      style: getButtonStyle(context, isLoading: isLoading).merge(_baseStyle),
      onPressed: isLoading ? null : onPressed,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        child: isLoading ? getProgressIndicator(context) : content,
      ),
    );
  }

  Widget _createContent() {
    assert(text != null);

    if (icon == null) {
      return FitText(child: Text(text!));
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPosition == ButtonIconPosition.left) ...[
            icon!,
            _sizeBetweenIconAndText,
          ],
          FitText(child: Text(text!)),
          if (iconPosition == ButtonIconPosition.right) ...[
            _sizeBetweenIconAndText,
            icon!,
          ],
        ],
      );
    }
  }
}

enum ButtonIconPosition {
  left,
  right,
}

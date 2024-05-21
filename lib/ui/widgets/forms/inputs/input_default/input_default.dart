import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_your_tale/ui/ui.dart';
import 'package:share_your_tale/ui/widgets/icon_svg/icon_svg.dart';

class InputDefault extends StatelessWidget {
  const InputDefault({
    this.autofocus = false,
    super.key,
    this.label,
    this.placeholder,
    this.suffixIcon,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.successText,
    this.errorText,
    this.controller,
    this.enabled = true,
    this.prefixIcon,
    this.hasClearMode = false,
    this.inputFormatters,
    this.keyboardType,
    this.onChanged,
    this.prefixIconConstraints = const BoxConstraints.expand(
      height: 22,
      width: 44,
    ),
    this.suffixIconConstraints = const BoxConstraints.expand(
      height: 22,
      width: 44,
    ),
    this.suffixText,
  });

  final String? label;
  final String? placeholder;
  final bool obscureText;
  final bool enableSuggestions;
  final String? successText;
  final String? errorText;
  final TextEditingController? controller;
  final bool enabled;
  final Widget Function(Color color)? prefixIcon;
  final Widget Function(Color color)? suffixIcon;
  final bool hasClearMode;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String text)? onChanged;
  final TextInputType? keyboardType;
  final bool autofocus;
  final BoxConstraints prefixIconConstraints;
  final BoxConstraints suffixIconConstraints;
  final String? suffixText;

  void _onClear() {
    controller?.clear();
    onChanged?.call(controller?.text ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeScope.of(context);
    final iconColor =
        enabled ? theme.color.priamryPressed : theme.color.grayscale10;

    Widget? getSuffixIcon() {
      if (suffixIcon != null) {
        return suffixIcon!(iconColor);
      }

      if (hasClearMode && controller?.text != null) {
        return GestureDetector(
          onTap: _onClear,
          child: IconSvg(
            ProjectIcons.xCircle,
            color: theme.color.priamryPressed,
          ),
        );
      }

      if (errorText != null) {
        return IconSvg(
          ProjectIcons.warning,
          color: theme.color.additionalError,
        );
      }

      return null;
    }

    final renderSuffixIcon = getSuffixIcon();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              label!,
              textAlign: TextAlign.start,
              style: TextStyle(color: theme.color.grayscale40)
                  .merge(theme.typography.body2),
            ),
          ),
        TextFormField(
          autofocus: autofocus,
          onChanged: onChanged,
          keyboardType: keyboardType,
          enabled: enabled,
          controller: controller,
          obscureText: obscureText,
          enableSuggestions: enableSuggestions,
          inputFormatters: inputFormatters,
          style: TextStyle(
            color: enabled ? theme.color.grayscale70 : theme.color.grayscale30,
          ).merge(theme.typography.body1),
          cursorColor: theme.color.grayscale70,
          cursorWidth: 1,
          decoration: InputDecoration(
            fillColor: theme.color.grayscale10,
            hintText: placeholder,
            filled: true,
            hintStyle: TextStyle(
              color: enabled
                  ? theme.color.primaryDefault
                  : theme.color.grayscale15,
            ).merge(theme.typography.caption),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            isDense: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: theme.color.grayscale30),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: theme.color.grayscale70),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: theme.color.additionalError),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: theme.color.primaryDefault),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: theme.color.grayscale20),
            ),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
                    child: prefixIcon?.call(
                      iconColor,
                    ),
                  )
                : null,
            // Padding used for suffixIcon - const EdgeInsets.fromLTRB(4, 0, 16, 0),
            suffixText: suffixText,
            suffixIcon: suffixText != null ? null : renderSuffixIcon,
            prefixIconConstraints: prefixIconConstraints,
            suffixIconConstraints: suffixIconConstraints,
          ),
        ),
        if (successText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              successText!,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: theme.color.primaryDefault,
              ).merge(theme.typography.body6),
            ),
          ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorText!,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: theme.color.additionalError,
              ).merge(theme.typography.body6),
            ),
          ),
      ],
    );
  }
}

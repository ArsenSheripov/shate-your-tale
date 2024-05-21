import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconSvg extends StatelessWidget {
  const IconSvg(
    this.assetName, {
    super.key,
    this.width,
    this.height,
    this.color,
  });

  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}

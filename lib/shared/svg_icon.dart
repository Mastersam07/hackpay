import 'package:flutter/material.dart';
import 'package:flutter_svg_plus/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.assetPath, {
    super.key,
    this.color,
    this.height,
    this.width,
    this.alignment,
    this.fit,
  });

  final String assetPath;
  final Color? color;
  final double? height;
  final double? width;
  final Alignment? alignment;
  final BoxFit? fit;

  static ColorFilter getSrcInColor(Color color) {
    return ColorFilter.mode(color, BlendMode.srcIn);
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: height,
      width: width,
      alignment: alignment ?? Alignment.center,
      fit: fit ?? BoxFit.contain,
      colorFilter: color != null ? getSrcInColor(color!) : null,
    );
  }
}

part of '../app_core.dart';

extension StringExtensions on String {
  Widget svg({
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgImage(
      this,
      width: width,
      height: height,
      color: color,
      fit: fit,
      type: PathType.assets,
    );
  }
}

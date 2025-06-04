part of '../global_widgets.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.fontStyle,
    this.shadows,
    this.maxLines,
  });

  final String text;
  final int? maxLines;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      softWrap: true,
      style: GoogleFonts.ibmPlexSans(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        shadows: shadows,
      ),
    );
  }
}

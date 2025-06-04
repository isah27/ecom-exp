part of '../global_widgets.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.text = "",
    this.onPressed,
    this.width,
    this.height,
    this.isLoading = false,
    this.child,
    this.isEnabled = true,
    this.padding,
  });
  final String text;
  final Function()? onPressed;
  final double? width, height;
  final bool isLoading;
  final Widget? child;
  final bool isEnabled;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: InkWell(
        onTap: !isEnabled || isLoading ? null : onPressed,
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 50,
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color:
                isEnabled
                    ? AppColors.primary
                    : AppColors.primary.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child:
              child ??
              Container(
                child:
                    isLoading
                        ? Center(
                          child: CupertinoActivityIndicator(
                            color: Colors.white,
                          ),
                        )
                        : Center(
                          child: AppText(
                            text: text,
                            size: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
              ),
        ),
      ),
    );
  }
}

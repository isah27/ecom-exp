part of '../global_widgets.dart';

class Header extends StatelessWidget {
  const Header({super.key, this.title = "Technology", this.extraWidget});
  final String title;
  final Widget? extraWidget;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalAssets.fullLogo.svg(),
                Expanded(
                  child: Column(
                    spacing: 6,
                    children: [
                      SizedBox(height: 0),
                      AppText(
                        text: "DELIVERY ADDRESS",
                        size: 11,
                        fontWeight: FontWeight.w600,
                      ),
                      AppText(
                        text: "Umuezike Road, Oyo State",
                        size: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                GlobalAssets.notification.svg(),
              ],
            ),
          ),
          extraWidget ?? const SizedBox.shrink(),
          const Divider(),
          InkWell(
            onTap: () {
              if (title != "Technology") {
                context.pop();
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, right: 5),
                  child: Icon(Icons.chevron_left, color: Color(0xff999999)),
                ),
                AppText(text: title, size: 20, fontWeight: FontWeight.w700),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

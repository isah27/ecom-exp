part of '../global_widgets.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  String currentTab = "Home";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavButton(
              iconPath: GlobalAssets.home,
              isActive: currentTab == "Home",
              label: "Home",
              onTap: (label) {
                setState(() {
                  currentTab = label;
                });
              },
            ),
            Badge.count(
              count: context.watch<CartCubit>().cartItems.length,
              backgroundColor: AppColors.primary,
              offset: Offset(-5, 0),
              isLabelVisible: context.watch<CartCubit>().cartItems.isNotEmpty,
              child: BottomNavButton(
                iconPath: GlobalAssets.cart,
                label: "Cart",
                isActive: currentTab == "Cart",
                onTap: (label) {
                  // setState(() {
                  //   currentTab = label;
                  // });
                  Future.delayed(Duration.zero, () {
                    if (!context.mounted) return;
                    context.push(RoutePaths.cart);
                  });
                },
              ),
            ),
            BottomNavButton(
              iconPath: GlobalAssets.favorite,
              label: "Favorite",
              isActive: currentTab == "Favorite",
              onTap: (label) {
                setState(() {
                  currentTab = label;
                });
              },
            ),
            BottomNavButton(
              iconPath: GlobalAssets.profile,
              label: "Profile",
              isActive: currentTab == "Profile",
              onTap: (label) {
                setState(() {
                  currentTab = label;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavButton extends StatelessWidget {
  const BottomNavButton({
    super.key,
    required this.iconPath,
    required this.label,
    this.isActive = false,
    required this.onTap,
  });
  final String iconPath, label;
  final bool isActive;
  final Function(String label) onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(label),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: isActive ? 65 : 55,
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(100),
            ),
            child: iconPath.svg(
              color: isActive ? AppColors.white : Color(0xff49454F),
            ),
          ),
          AppText(
            text: label,
            size: 13,
            fontWeight: FontWeight.w600,
            color: isActive ? AppColors.primary : Color(0xff49454F),
          ),
        ],
      ),
    );
  }
}

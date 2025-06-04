part of '../cart_widgets.dart';

class CartActionButton extends StatelessWidget {
  const CartActionButton({
    super.key,
    required this.icon,
    this.isActive = true,
    this.onTap,
  });
  final IconData icon;
  final bool isActive;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isActive ? AppColors.white : Color(0xffe2e8f0),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.grey700, size: 20),
      ),
    );
  }
}

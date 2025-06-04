part of '../cart_widgets.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.cart});
  final CartModel cart;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xfff6f5f8),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            cart.product.imageUrl,
            height: 106,
            width: 102.86,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: cart.product.name,
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey700,
                ),
                AppText(
                  text: cart.product.price,
                  color: AppColors.grey700,
                  size: 18,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  text: "In stock",
                  color: Color(0xff10B981),
                  size: 13,
                  fontWeight: FontWeight.w400,
                ),

                Row(
                  spacing: 20,
                  children: [
                    CartActionButton(
                      icon: Icons.remove,
                      isActive: cart.canDecreaseQty,
                      onTap: () {
                        context.read<CartCubit>().decreaseQty(cart);
                      },
                    ),
                    AppText(
                      text: "${cart.quantity}",
                      size: 14,
                      color: AppColors.grey700,
                    ),
                    CartActionButton(
                      icon: Icons.add,
                      isActive: cart.canIncreaseQty,
                      onTap: () {
                        context.read<CartCubit>().increaseQty(cart);
                      },
                    ),
                    Expanded(
                      child: CartActionButton(
                        icon: CupertinoIcons.trash,
                        onTap: () {
                          context.read<CartCubit>().removeCart(cart);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

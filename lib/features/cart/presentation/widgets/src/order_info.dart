part of '../cart_widgets.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final watchCart = context.watch<CartCubit>();
    final info = watchCart.cartInfo;
    return watchCart.cartItems.isEmpty
        ? const SizedBox.shrink()
        : Container(
          color: const Color(0xfffbfbfb),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "Order Info",
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: "Subtotal",
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  AppText(
                    text: "\$${info.subtotal}",
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: "Shipping",
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  AppText(
                    text: "\$${info.shippingFee}",
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: "Total", size: 14, fontWeight: FontWeight.w500),
                  AppText(
                    text: "\$${info.total}",
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        );
  }
}

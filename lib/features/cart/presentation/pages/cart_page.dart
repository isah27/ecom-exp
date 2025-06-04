import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecom_exp/global_widgets/global_widgets.dart';
import 'package:ecom_exp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecom_exp/features/cart/presentation/widgets/cart_widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<CartCubit>();
    final cartItems = watch.cartItems;
    return AppScaffold(
      isLoading: watch.state is CartLoading,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(title: "Your Cart"),
          Expanded(
            child: Container(
              color: const Color(0xfffbfbfb),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child:
                  cartItems.isEmpty
                      ? EmptyCart()
                      : ListView(
                        children:
                            cartItems
                                .map((item) => CartCard(cart: item))
                                .toList(),
                      ),
            ),
          ),
          OrderInfo(),
        ],
      ),
      bottomNavigationBar:
          cartItems.isEmpty
              ? null
              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(text: "Checkout (\$${watch.cartInfo.total})"),
              ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecom_exp/config/app_configs.dart';
import 'package:ecom_exp/global_widgets/global_widgets.dart';
import 'package:ecom_exp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecom_exp/features/product/presentation/cubit/product_cubit.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final product = context.watch<ProductCubit>().selectedProductModel;
    final isInCart = context.read<CartCubit>().isIncart(product!);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Header(title: "Go back"),
          Expanded(
            child: Container(
              color: Color(0xfffbfbfb),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  Hero(
                    tag: "${product.id}",
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset(
                          product.imageUrl,
                          height: 300,
                          width: 360,
                          fit: BoxFit.cover,
                        ),
                        Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                product.favorite = !product.favorite;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                product.favorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: product.favorite ? Colors.red : null,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppText(
                    text: product.removeNewLine,
                    size: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 5),
                  AppText(
                    text: product.price,
                    size: 32,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff000000),
                  ),

                  const SizedBox(height: 10),
                  AppText(
                    text: "About this item",
                    size: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff999999),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: AppText(
                      text: product.description,
                      size: 14,
                      color: const Color(0xff999999),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: AppButton(
              text: isInCart ? "Go to cart" : "Add to cart",
              isLoading: context.watch<CartCubit>().state is CartLoading,
              onPressed: () {
                if (isInCart) {
                  context.push(RoutePaths.cart);
                  return;
                }
                context.read<CartCubit>().addToCart(product, 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}

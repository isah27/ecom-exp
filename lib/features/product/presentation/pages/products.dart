import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecom_exp/config/app_configs.dart';
import 'package:ecom_exp/global_widgets/global_widgets.dart';
import 'package:ecom_exp/features/product/data/repo/product_assets.dart';
import 'package:ecom_exp/features/product/data/models/product_model.dart';
import 'package:ecom_exp/features/product/presentation/cubit/product_cubit.dart';
import 'package:ecom_exp/features/product/presentation/widgets/product_widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductCubit>().products;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            extraWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextfield(
                hintText: "Search...",
                isSearchField: true,
                onChange: (val) {
                  context.read<ProductCubit>().filterProducts(val);
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xfffbfbfb),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Column(
                children: [
                  AppText(
                    text: "Smartphones, Laptops & Assecories",
                    fontWeight: FontWeight.w500,
                    size: 20,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.72,
                      children: List.generate(products.length, (index) {
                        return ProductCard(product: products[index]);
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

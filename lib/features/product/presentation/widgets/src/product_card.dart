part of '../product_widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          context.read<ProductCubit>().selectProduct(product);
          context.push(RoutePaths.productDetail);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "${product.id}",
              child: Image.asset(product.imageUrl, height: 150),
            ),
            Expanded(child: AppText(text: product.name, size: 14, maxLines: 2)),
            // SizedBox(height: 3),
            Expanded(
              child: AppText(
                text: product.price,
                size: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

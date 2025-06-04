import 'package:ecom_exp/features/product/data/models/product_model.dart';

abstract class ProductRepo {
  List<ProductModel> fetchProducts();
}

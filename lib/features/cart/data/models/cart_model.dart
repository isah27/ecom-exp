import 'package:ecom_exp/features/product/data/models/product_model.dart';

class CartModel {
  int id, quantity;
  ProductModel product;
  CartModel({required this.id, required this.quantity, required this.product});
  num get totalPrice => product.amount * quantity;
  bool get canIncreaseQty => quantity < product.quantity;
  bool get canDecreaseQty => quantity > 1;
}

import 'package:ecom_exp/features/cart/domain/i_cart_repository.dart';

class CartRepository implements ICartRepository {
  @override
  Future<bool> addToCart(productId, int quantity) async {
    return await Future.delayed(const Duration(seconds: 1), () => true);
  }

  @override
  Future<bool> removeFromCart(cartID) async {
    return await Future.delayed(const Duration(seconds: 1), () => true);
  }

  @override
  Future<bool> updateCartItem(cartID, int quantity) async {
    return await Future.delayed(const Duration(seconds: 1), () => true);
  }
}

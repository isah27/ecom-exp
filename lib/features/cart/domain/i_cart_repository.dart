abstract class ICartRepository {
  Future<bool> addToCart(dynamic cartId, int quantity);

  Future<bool> removeFromCart(dynamic cartId);

  Future<bool> updateCartItem(dynamic cartId, int quantity);
}

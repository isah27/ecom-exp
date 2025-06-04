import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ecom_exp/core/Utils/num_extension.dart';
import 'package:ecom_exp/features/cart/data/models/cart_model.dart';
import 'package:ecom_exp/features/cart/domain/i_cart_repository.dart';
import 'package:ecom_exp/features/product/data/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  ICartRepository cartRepository;
  CartCubit(this.cartRepository) : super(CartInitial());
  List<CartModel> cartItems = [];
  addToCart(ProductModel product, int qty) async {
    try {
      emit(CartLoading());
      final added = await cartRepository.addToCart(product.id, qty);
      if (added) {
        cartItems.add(
          CartModel(
            id: DateTime.now().millisecond,
            quantity: qty,
            product: product,
          ),
        );
        emit(CartAdded());
      } else {
        emit(CartError(error: "Failed to add item to cart"));
      }
    } catch (e) {
      emit(CartError());
    }
  }

  bool isIncart(ProductModel product) {
    return cartItems.any((cart) => cart.product.id == product.id);
  }

  ({num subtotal, num shippingFee, num total}) get cartInfo {
    final subtotal = cartItems.map((item) => item.totalPrice).sum;
    final shippingFee = 10 * cartItems.map((item) => item.quantity).sum;
    final total = subtotal + shippingFee;
    return (subtotal: subtotal, shippingFee: shippingFee, total: total);
  }

  increaseQty(CartModel cart) async {
    if (!cart.canIncreaseQty || state is CartLoading) return;
    try {
      emit(CartLoading());
      final updated = await cartRepository.updateCartItem(
        cart.id,
        cart.quantity + 1,
      );
      if (updated) {
        cart.quantity += 1;
        emit(CartUpdated());
      } else {
        emit(CartError(error: "Failed to update item in cart"));
      }
    } catch (e) {
      emit(CartError());
    }
  }

  decreaseQty(CartModel cart) async {
    if (!cart.canDecreaseQty || state is CartLoading) return;
    try {
      emit(CartLoading());
      final updated = await cartRepository.updateCartItem(
        cart.id,
        cart.quantity - 1,
      );
      if (updated) {
        cart.quantity -= 1;
        emit(CartUpdated());
      } else {
        emit(CartError(error: "Failed to update item in cart"));
      }
    } catch (e) {
      emit(CartError());
    }
  }

  removeCart(CartModel cart) async {
    try {
      emit(CartLoading());
      final removed = await cartRepository.removeFromCart(cart.id);
      if (removed) {
        cartItems.remove(cart);
        emit(CartRemoved());
      } else {
        emit(CartError(error: "Failed to remove item from cart"));
      }
    } catch (e) {
      emit(CartError());
    }
  }
}

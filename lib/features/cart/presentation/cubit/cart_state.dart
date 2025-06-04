part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartAdded extends CartState {}

final class CartUpdated extends CartState {}

final class CartRemoved extends CartState {}

final class CartError extends CartState {
  final String error;
  const CartError({this.error = "Something went wrong!"});
}

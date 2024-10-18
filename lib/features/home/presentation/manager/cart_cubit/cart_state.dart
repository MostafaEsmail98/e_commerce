part of 'cart_cubit.dart';

class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CheckoutLoading extends CartState {}

final class CartFailure extends CartState {
  String error;

  CartFailure(this.error);
}

final class CartAddFailure extends CartState {
  String error;

  CartAddFailure(this.error);
}

final class CheckoutFailure extends CartState {
  String error;

  CheckoutFailure(this.error);
}

final class CartSuccessful extends CartState {
  CartEntity cartEntity;

  CartSuccessful(this.cartEntity);
}

final class CartAddSuccessful extends CartState {
  String res;

  CartAddSuccessful(this.res);
}

final class CheckoutSuccessful extends CartState {
  CheckoutModel res;

  CheckoutSuccessful(this.res);
}

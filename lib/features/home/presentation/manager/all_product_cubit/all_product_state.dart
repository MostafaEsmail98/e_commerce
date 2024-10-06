part of 'all_product_cubit.dart';

class AllProductState {}

final class AllProductInitial extends AllProductState {}

final class AllProductLoading extends AllProductState {}

final class AllProductSuccessful extends AllProductState {
  AllProductEntity allProductEntity;

  AllProductSuccessful(this.allProductEntity);
}

final class AllProductFailure extends AllProductState {
  ErrorModel errorModel;

  AllProductFailure(this.errorModel);
}

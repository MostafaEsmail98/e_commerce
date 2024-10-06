part of 'brands_cubit.dart';

class BrandsState {}

final class BrandsInitial extends BrandsState {}

final class BrandsLoading extends BrandsState {}

final class BrandsSuccessful extends BrandsState {
  BrandsEntity brandsEntity;

  BrandsSuccessful(this.brandsEntity);
}

final class BrandsFailure extends BrandsState {
  ErrorModel errorModel;

  BrandsFailure(this.errorModel);
}

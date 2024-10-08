part of 'specific_product_cubit.dart';

class SpecificProductState {}

final class SpecificProductInitial extends SpecificProductState {}

final class SpecificProductLoading extends SpecificProductState {}

final class SpecificProductSuccessful extends SpecificProductState {
  SpecificProductEntity specificProductEntity;

  SpecificProductSuccessful(this.specificProductEntity);
}

final class SpecificProductFailure extends SpecificProductState {
  String errorModel;

  SpecificProductFailure(this.errorModel);
}

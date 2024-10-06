part of 'categories_cubit.dart';

class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
final class CategoriesLoading extends CategoriesState {}
final class CategoriesSuccessful extends CategoriesState {
  CategoriesEntity categoriesEntity;

  CategoriesSuccessful(this.categoriesEntity);
}
final class CategoriesFailure extends CategoriesState {
  ErrorModel errorModel ;

  CategoriesFailure(this.errorModel);
}

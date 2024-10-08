part of 'categories_tab_cubit.dart';

 class CategoriesTabState {}

final class CategoriesTabInitial extends CategoriesTabState {}
final class CategoriesTabLoading extends CategoriesTabState {}
final class CategoriesTabSuccessful extends CategoriesTabState {
   CategoriesTabEntity categoriesTabEntity ;

   CategoriesTabSuccessful(this.categoriesTabEntity);
}
final class CategoriesTabFailure extends CategoriesTabState {
   ErrorModel errorModel ;

   CategoriesTabFailure(this.errorModel);
}

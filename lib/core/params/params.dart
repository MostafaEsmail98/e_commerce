class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}

class SignUpParams {
  final String email;
  final String password;
  final String rePassword;
  final String name;
  final String mobil;

  SignUpParams({required this.name, required this.mobil, required this.email, required this.password, required  this.rePassword});
}

class ForgetPasswordParams{
  final String email;

  ForgetPasswordParams({required this.email});
}

class VerifyCodeParams {
  final String resetCode;

  VerifyCodeParams({required this.resetCode});
}
class ResetPasswordParams{
  final String email;
  final String newPassword;

  ResetPasswordParams({required this.email, required this.newPassword});
}
class AllProductParams{
  final String? id;
  final bool? check ;

  AllProductParams({required this.check, required this.id});
}class ProductParams{
  final String? id;

  ProductParams({required this.id});
}class CategoriesTabParams{
  final String? id;

  CategoriesTabParams({required this.id});
}class PostWishlistParams{
  final String? productId;

  PostWishlistParams({required this.productId});
}
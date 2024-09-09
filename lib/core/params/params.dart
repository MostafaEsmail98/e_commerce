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
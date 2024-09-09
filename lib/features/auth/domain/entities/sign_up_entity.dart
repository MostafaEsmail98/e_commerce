

class SignUpEntity {
  final UserNewEntity user;

  final String token;

  SignUpEntity({required this.user, required this.token});
}



class UserNewEntity {
  final String name ;
  final String email ;

  UserNewEntity({required this.name, required this.email});
}


class SignInEntity {
  final UserEntity user;

  final String token;

  SignInEntity({required this.user, required this.token});
}



class UserEntity {
 final String name ;
 final String email ;

 UserEntity({required this.name, required this.email});
}
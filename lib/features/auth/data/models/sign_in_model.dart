import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_in_entity.dart';

class SignInModel extends SignInEntity {
  final String message;

  SignInModel(
      {required this.message, required super.user, required super.token});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      user: UserModel.fromJson(json[ApiKey.user]),
      token: json[ApiKey.token],
      message: json[ApiKey.message],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.user: user,
      ApiKey.token: token,
    };
  }
}

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json[ApiKey.name], email: json[ApiKey.email]);
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.name: name,
      ApiKey.email: email,
    };
  }
}

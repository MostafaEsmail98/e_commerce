import 'package:e_commrece/core/database/api/endpoints.dart';
import '../../domain/entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  final String message;

  SignUpModel(
      {required this.message, required super.user, required super.token});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      user: UserNewModel.fromJson(json[ApiKey.user]),
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

class UserNewModel extends UserNewEntity {
  UserNewModel({required super.name, required super.email});

  factory UserNewModel.fromJson(Map<String, dynamic> json) {
    return UserNewModel(name: json[ApiKey.name], email: json[ApiKey.email]);
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.name: name,
      ApiKey.email: email,
    };
  }
}

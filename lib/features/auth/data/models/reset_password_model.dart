import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/features/auth/domain/entities/reset_password_entity.dart';

class ResetPasswordModel extends ResetPasswordEntity{
  ResetPasswordModel({required super.token});
  factory ResetPasswordModel.fromJson(Map<String,dynamic> json){
    return ResetPasswordModel(token: json[ApiKey.token]);
  }
}
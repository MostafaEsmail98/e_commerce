import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/features/auth/domain/entities/verify_code_entity.dart';

class VerifyCodeModel extends VerifyCodeEntity{
  VerifyCodeModel(super.status);

  factory VerifyCodeModel.fromJson(Map<String,dynamic> json){
    return VerifyCodeModel(json[ApiKey.status]);
  }
}
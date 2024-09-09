import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/features/auth/domain/entities/forget_password_entity.dart';

class ForgetPasswordModel extends ForgetPasswordEntity {
  final String statusMsg;

  ForgetPasswordModel({required this.statusMsg, required super.message});

  factory ForgetPasswordModel.fromJsom(Map<String, dynamic> json){
    return ForgetPasswordModel(
        message: json[ApiKey.message], statusMsg: json[ApiKey.statusMsg]);
  }
}
import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/forget_password_entity.dart';

abstract class ForgetPasswordRepo {
  Future<Either<ErrorModel, ForgetPasswordEntity>> postForgetPasswordUser(
      {required ForgetPasswordParams params});
}

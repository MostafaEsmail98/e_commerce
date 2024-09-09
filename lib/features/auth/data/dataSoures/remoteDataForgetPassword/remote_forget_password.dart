import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';

import '../../../../../core/errors/error_model.dart';
import '../../../domain/entities/forget_password_entity.dart';

abstract class RemoteForgetPassword {
  Future<Either<ErrorModel, ForgetPasswordEntity>> postForgetPasswordUser({required ForgetPasswordParams params});
}
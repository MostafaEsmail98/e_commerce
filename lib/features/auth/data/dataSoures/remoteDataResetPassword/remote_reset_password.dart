import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/models/reset_password_model.dart';

abstract class RemoteResetPassword {
  Future<Either<ErrorModel,ResetPasswordModel>> resetPassword(ResetPasswordParams params);
}
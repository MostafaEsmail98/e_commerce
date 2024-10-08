import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/models/reset_password_model.dart';

abstract class RemoteResetPassword {
  Future<Either<Failure,ResetPasswordModel>> resetPassword(ResetPasswordParams params);
}
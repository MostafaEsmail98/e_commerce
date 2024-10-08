import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/reset_password_entity.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure,ResetPasswordEntity>> resetPassword(ResetPasswordParams params);
}
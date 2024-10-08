import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';

import '../../../domain/entities/forget_password_entity.dart';

abstract class RemoteForgetPassword {
  Future<Either<Failure, ForgetPasswordEntity>> postForgetPasswordUser({required ForgetPasswordParams params});
}
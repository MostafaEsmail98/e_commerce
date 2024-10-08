import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/verify_code_entity.dart';

abstract class VerifyCodeRepo {
  Future<Either<Failure, VerifyCodeEntity>> postVerify(
      {required VerifyCodeParams params});
}

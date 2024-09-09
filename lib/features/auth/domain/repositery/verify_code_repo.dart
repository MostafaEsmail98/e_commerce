import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/verify_code_entity.dart';

abstract class VerifyCodeRepo {
  Future<Either<ErrorModel, VerifyCodeEntity>> postVerify(
      {required VerifyCodeParams params});
}

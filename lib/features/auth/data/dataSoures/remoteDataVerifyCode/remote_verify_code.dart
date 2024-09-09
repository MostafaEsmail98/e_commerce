import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/models/verify_code_model.dart';

abstract class RemoteVerifyCode {
  Future<Either<ErrorModel, VerifyCodeModel>> postVerifyCode(
      {required VerifyCodeParams params});
}

import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/models/verify_code_model.dart';

abstract class RemoteVerifyCode {
  Future<Either<Failure, VerifyCodeModel>> postVerifyCode(
      {required VerifyCodeParams params});
}

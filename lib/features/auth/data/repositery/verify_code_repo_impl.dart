import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataVerifyCode/remote_verify_code.dart';
import 'package:e_commrece/features/auth/domain/entities/verify_code_entity.dart';
import 'package:e_commrece/features/auth/domain/repositery/verify_code_repo.dart';

class VerifyCodeRepoImpl extends VerifyCodeRepo {
  RemoteVerifyCode remoteVerifyCode ;

  VerifyCodeRepoImpl({required this.remoteVerifyCode});

  @override
  Future<Either<ErrorModel, VerifyCodeEntity>> postVerify(
      {required VerifyCodeParams params}) {
    return remoteVerifyCode.postVerifyCode(params: params);
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataForgetPassword/remote_forget_password.dart';
import 'package:e_commrece/features/auth/domain/entities/forget_password_entity.dart';
import 'package:e_commrece/features/auth/domain/repositery/forget_password_repo.dart';


class ForgetPasswordRepoImpl extends ForgetPasswordRepo {
  RemoteForgetPassword remoteForgetPassword;

  ForgetPasswordRepoImpl({required this.remoteForgetPassword});

  @override
  Future<Either<Failure, ForgetPasswordEntity>> postForgetPasswordUser(
      {required ForgetPasswordParams params}) async {
    return await remoteForgetPassword.postForgetPasswordUser(params: params);
  }
}

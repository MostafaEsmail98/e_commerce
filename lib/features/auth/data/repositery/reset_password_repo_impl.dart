import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataResetPassword/remote_reset_password.dart';
import 'package:e_commrece/features/auth/domain/entities/reset_password_entity.dart';
import 'package:e_commrece/features/auth/domain/repositery/reset_password_repo.dart';

class ResetPasswordRepoImpl extends ResetPasswordRepo {
  RemoteResetPassword remoteResetPassword;

  ResetPasswordRepoImpl({required this.remoteResetPassword});

  @override
  Future<Either<ErrorModel, ResetPasswordEntity>> resetPassword(
      ResetPasswordParams params) async{
    return await remoteResetPassword.resetPassword(params);
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/repositery/reset_password_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../entities/reset_password_entity.dart';

class ResetPasswordUseCases {
  ResetPasswordRepo resetPasswordRepo ;

  ResetPasswordUseCases({required this.resetPasswordRepo});

  Future<Either<Failure, ResetPasswordEntity>>  call (ResetPasswordParams params){
    return resetPasswordRepo.resetPassword(params);
  }
}
import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/repositery/forget_password_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../entities/forget_password_entity.dart';

class ForgetPasswordUseCases {
  ForgetPasswordRepo forgetPasswordRepo;

  ForgetPasswordUseCases({required this.forgetPasswordRepo});

  Future<Either<Failure, ForgetPasswordEntity>> call(
      {required ForgetPasswordParams params}) {
    return forgetPasswordRepo.postForgetPasswordUser(params: params);
  }
}

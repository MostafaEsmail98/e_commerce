import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/verify_code_entity.dart';
import 'package:e_commrece/features/auth/domain/repositery/verify_code_repo.dart';

import '../../../../core/errors/exceptions.dart';

class VerifyCodeUseCases {
  VerifyCodeRepo verifyCodeRepo;

  VerifyCodeUseCases({required this.verifyCodeRepo});

  Future<Either<Failure, VerifyCodeEntity>> call(
      {required VerifyCodeParams params}) async {
    return await verifyCodeRepo.postVerify(params: params);
  }
}

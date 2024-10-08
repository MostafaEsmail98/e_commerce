import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_in_entity.dart';
import 'package:e_commrece/features/auth/domain/repositery/sign_in_repo.dart';

import '../../../../core/errors/exceptions.dart';

 class SignInUsesCase {
  SignInRepo signInRepo;

  SignInUsesCase({required this.signInRepo});

  Future<Either<Failure, SignInEntity>> call({required SignInParams params}) {
    return signInRepo.postUser(params: params);
  }
}

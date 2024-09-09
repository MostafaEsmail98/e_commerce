import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_in_entity.dart';
import 'package:e_commrece/features/auth/domain/repositery/sign_in_repo.dart';

 class SignInUsesCase {
  SignInRepo signInRepo;

  SignInUsesCase({required this.signInRepo});

  Future<Either<ErrorModel, SignInEntity>> call({required SignInParams params}) {
    return signInRepo.postUser(params: params);
  }
}

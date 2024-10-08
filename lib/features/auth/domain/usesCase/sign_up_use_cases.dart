import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_up_entity.dart';
import 'package:e_commrece/features/auth/domain/repositery/sign_up_repo.dart';

import '../../../../core/errors/exceptions.dart';

class SignUpUseCases {
  SignUpRepo signUpRepo;

  SignUpUseCases({required this.signUpRepo});

  Future<Either<Failure, SignUpEntity>> call({required SignUpParams params}){
    return signUpRepo.postNewUser(params: params);
  }
}
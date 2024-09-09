import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_up_entity.dart';
import 'package:e_commrece/features/auth/domain/repositery/sign_up_repo.dart';

class SignUpUseCases {
  SignUpRepo signUpRepo;

  SignUpUseCases({required this.signUpRepo});

  Future<Either<ErrorModel, SignUpEntity>> call({required SignUpParams params}){
    return signUpRepo.postNewUser(params: params);
  }
}
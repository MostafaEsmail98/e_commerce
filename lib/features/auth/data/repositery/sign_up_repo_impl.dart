import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataSignUp/remote_sign_up.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_up_entity.dart';
import 'package:e_commrece/features/auth/domain/repositery/sign_up_repo.dart';

import '../../../../core/errors/exceptions.dart';

class SignUpRepoImpl extends SignUpRepo {
  RemoteSignUp remoteSignUp;

  SignUpRepoImpl({required this.remoteSignUp});

  @override
  Future<Either<Failure, SignUpEntity>> postNewUser(
      {required SignUpParams params}) async{
    return await remoteSignUp.postNewUser(params: params);
  }
}

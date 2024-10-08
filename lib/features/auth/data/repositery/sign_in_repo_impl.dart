import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_in_entity.dart';
import 'package:e_commrece/features/auth/domain/repositery/sign_in_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../dataSoures/remoteDataSignIn/remote_sign_in.dart';

class SignInRepoImpl extends SignInRepo {
  RemoteSignIn remoteSignIn;

  SignInRepoImpl({required this.remoteSignIn});

  @override
  Future<Either<Failure, SignInEntity>> postUser(
      {required SignInParams params}) async {
    return await remoteSignIn.postUser(params: params);
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteData/remote_sign_in.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_in_entity.dart';
import 'package:e_commrece/features/auth/domain/repositery/sign_in_repo.dart';

class SignInRepoImpl extends SignInRepo {
  RemoteSignIn remoteSignIn;

  SignInRepoImpl({required this.remoteSignIn});

  @override
  Future<Either<ErrorModel, SignInEntity>> postUser(
      {required SignInParams params}) async {
    return await remoteSignIn.postUser(params: params);
  }
}

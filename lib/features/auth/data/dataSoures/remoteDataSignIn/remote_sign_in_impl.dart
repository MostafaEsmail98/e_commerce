import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataSignIn/remote_sign_in.dart';
import 'package:e_commrece/features/auth/data/models/sign_in_model.dart';

import '../../../../../core/errors/exceptions.dart';

class RemoteSignInImpl extends RemoteSignIn {
  ApiConsumer api;

  RemoteSignInImpl({required this.api});

  @override
  Future<Either<ErrorModel, SignInModel>> postUser(
      {required SignInParams params}) async {
    try {
      var response = await api.post(Endpoints.signIn,
          data: {"email": params.email, "password": params.password});
      return right(SignInModel.fromJson(response));
    } on ServerExceptions catch (e) {
      return left(ErrorModel(errMassage: e.errorModel.errMassage));
    }
  }
}

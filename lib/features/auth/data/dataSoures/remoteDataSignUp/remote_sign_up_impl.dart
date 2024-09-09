import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataSignUp/remote_sign_up.dart';
import 'package:e_commrece/features/auth/data/models/sign_up_model.dart';

class RemoteSignUpImpl extends RemoteSignUp {
  ApiConsumer api;

  RemoteSignUpImpl({required this.api});

  @override
  Future<Either<ErrorModel, SignUpModel>> postNewUser(
      {required SignUpParams params}) async {
    try {
   var response = await api.post(Endpoints.signUp, data: {
        "name": params.name,
        "email": params.email,
        "password": params.password,
        "rePassword":params.rePassword,
        "phone":params.mobil
      });
  return Right(SignUpModel.fromJson(response));
    } on ServerExceptions catch (e) {
      return Left(ErrorModel(errMassage: e.errorModel.errMassage));
    }
  }
}

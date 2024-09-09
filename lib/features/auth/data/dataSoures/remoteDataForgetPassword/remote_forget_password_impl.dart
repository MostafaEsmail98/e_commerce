import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataForgetPassword/remote_forget_password.dart';
import 'package:e_commrece/features/auth/data/models/forget_password_model.dart';

class RemoteForgetPasswordImpl extends RemoteForgetPassword {
  ApiConsumer api ;

  RemoteForgetPasswordImpl({required this.api});

  @override
  Future<Either<ErrorModel, ForgetPasswordModel>> postForgetPasswordUser(
      {required ForgetPasswordParams params}) async{
    try {
    var response = await  api.post(Endpoints.forgetPassword,data: {
        "email":params.email
      });
    return Right(ForgetPasswordModel.fromJsom(response));
    } on ServerExceptions catch (e) {
      return Left(ErrorModel(errMassage: e.errorModel.errMassage));
    }
  }
}

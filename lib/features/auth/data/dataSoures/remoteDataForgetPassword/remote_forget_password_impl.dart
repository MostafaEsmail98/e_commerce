import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataForgetPassword/remote_forget_password.dart';
import 'package:e_commrece/features/auth/data/models/forget_password_model.dart';

class RemoteForgetPasswordImpl extends RemoteForgetPassword {
  ApiConsumer api ;

  RemoteForgetPasswordImpl({required this.api});

  @override
  Future<Either<Failure, ForgetPasswordModel>> postForgetPasswordUser(
      {required ForgetPasswordParams params}) async{
    try {
    var response = await  api.post(Endpoints.forgetPassword,data: {
        "email":params.email
      });
    return Right(ForgetPasswordModel.fromJsom(response));
    } catch (e) {
      if (e is DioException){
        return Left(ServerFailure.fromServer(e));
      }else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}

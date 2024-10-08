import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataResetPassword/remote_reset_password.dart';
import 'package:e_commrece/features/auth/data/models/reset_password_model.dart';

class RemoteResetPasswordImpl extends RemoteResetPassword{
  ApiConsumer api ;

  RemoteResetPasswordImpl({required this.api});

  @override
  Future<Either<Failure, ResetPasswordModel>> resetPassword(ResetPasswordParams params) async{
    try {
      var response = await api.put(Endpoints.resetPassword,data: {
        "email":params.email,
        "newPassword":params.newPassword
      });
      return Right(ResetPasswordModel.fromJson(response));
    }  catch (e) {
      if (e is DioException){
        return Left(ServerFailure.fromServer(e));
      }else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
  
}
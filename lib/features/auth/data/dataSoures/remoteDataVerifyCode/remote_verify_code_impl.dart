import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataVerifyCode/remote_verify_code.dart';
import 'package:e_commrece/features/auth/data/models/verify_code_model.dart';

class RemoteVerifyCodeImpl extends RemoteVerifyCode {
  ApiConsumer api;

  RemoteVerifyCodeImpl({required this.api});

  @override
  Future<Either<Failure, VerifyCodeModel>> postVerifyCode(
      {required VerifyCodeParams params}) async {
    try {
      var response = await api.post(Endpoints.verifyCode, data: {
        "resetCode": params.resetCode
      });
      return Right(VerifyCodeModel.fromJson(response));
    }  catch (e) {
      if (e is DioException){
        return Left(ServerFailure.fromServer(e));
      }else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

}
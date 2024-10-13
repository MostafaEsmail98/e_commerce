import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteUpdateUser/remote_update_user.dart';
import 'package:e_commrece/features/home/data/models/update_user_model.dart';

import '../../../../../core/params/params.dart';
import '../../models/get_user_model.dart';

class RemoteUpdateUserImpl extends RemoteUpdateUser{
  ApiConsumer api ;

  RemoteUpdateUserImpl({required this.api});

  @override
  Future<Either<Failure, UpdateUserModel>> updateUser(UpdateUserParams params) async{
    try {
      var response =  await api.put(Endpoints.updateUser,data: {
        "name": params.name,
        "email": params.email,
        "phone": params.phone
      });
      return Right(UpdateUserModel.fromJson(response));
    }  catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromServer(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }

  }

  @override
  Future<Either<Failure, GetUserModel>> getUser(UpdateUserParams params) async{
    try {
      var response =  await api.get(Endpoints.getUser+params.id!);
      return Right(GetUserModel.fromJson(response));
    }  catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromServer(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> changePassword(ChangePasswordParams params) async{
    try {
      var response =  await api.put(Endpoints.changePassword,data: {
        "currentPassword":params.currentPassword,
        "password":params.password,
        "rePassword":params.rePassword
      });
      return Right(response["statusMsg"]);
    }  catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromServer(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
  
}
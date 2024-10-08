import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteSpecificProduct/remote_specific_product.dart';
import 'package:e_commrece/features/home/data/models/specific_product_model.dart';

import '../../../../../core/errors/exceptions.dart';

class RemoteSpecificProductImpl extends RemoteSpecificProduct{
  ApiConsumer api;

  RemoteSpecificProductImpl({required this.api});

  @override
  Future<Either<Failure, SpecificProductModel>> getSpecificProduct(ProductParams params) async{
    try {
      var response  = await api.get(Endpoints.specificProduct+params.id!);
      print(SpecificProductModel.fromJson(response).data!.id!);
      return Right(SpecificProductModel.fromJson(response));
    }  catch (e) {
      if (e is DioException){
        return Left(ServerFailure.fromServer(e));
      }else {
        return Left(ServerFailure(e.toString()));
      }
    }

  }
}
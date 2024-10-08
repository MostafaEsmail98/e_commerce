import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteAllProduct/remote_all_product.dart';
import 'package:e_commrece/features/home/data/models/all_product_model.dart';

import '../../../../../core/errors/exceptions.dart';

class RemoteAllProductImpl extends RemoteAllProduct{
  ApiConsumer api;

  RemoteAllProductImpl({required this.api});

  @override
  Future<Either<ErrorModel, AllProductModel>> getAllProduct(AllProductParams params) async{
    if (params.check==true){
      try {
        var response =await  api.get(Endpoints.product+params.id!);
        return Right(AllProductModel.fromJson(response));
      } on ServerExceptions catch (e) {
        return Left(ErrorModel(errMassage: e.errorModel.errMassage));
      }
    }
    else {
      try {
        var response =await  api.get(Endpoints.productOfCategory+params.id!);
        return Right(AllProductModel.fromJson(response));
      } on ServerExceptions catch (e) {
        return Left(ErrorModel(errMassage: e.errorModel.errMassage));
      }
    }

  }
  
}
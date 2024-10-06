import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteBrands/remote_brands.dart';
import 'package:e_commrece/features/home/data/models/brands_model.dart';

import '../../../../../core/errors/exceptions.dart';

class RemoteBrandsImpl extends RemoteBrands{
  ApiConsumer api ;

  RemoteBrandsImpl({required this.api});

  @override
  Future<Either<ErrorModel, BrandsModel>> getBrands() async{
    try {
     var response= await api.get(Endpoints.brands);
     return Right(BrandsModel.fromJson(response));
    }  on ServerExceptions catch (e) {
      return Left(ErrorModel(errMassage: e.errorModel.errMassage));
    }
  }
  
}
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteAllCategories/remote_all_categories.dart';
import 'package:e_commrece/features/home/data/models/categories_model.dart';

import '../../../../../core/errors/exceptions.dart';

class RemoteAllCategoriesImpl extends RemoteAllCategories {
  ApiConsumer api;

  RemoteAllCategoriesImpl({required this.api});

  @override
  Future<Either<Failure, CategoriesModel>> getAllCategories() async {
    try {
      var response = await api.get(Endpoints.categories);
      return Right(CategoriesModel.fromJson(response));
    }  catch (e) {
      if (e is DioException){
        return Left(ServerFailure.fromServer(e));
      }else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}

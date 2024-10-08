import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteCategoriesTab/remote_categories_tab.dart';
import 'package:e_commrece/features/home/data/models/categories_tab_model.dart';

import '../../../../../core/errors/exceptions.dart';

class RemoteCategoriesTabImpl extends RemoteCategoriesTab {
  ApiConsumer api;

  RemoteCategoriesTabImpl({required this.api});

  @override
  Future<Either<Failure, CategoriesTabModel>> getCategories(
      CategoriesTabParams params) async {
    try {
      var response = await api.get(Endpoints.categoriesTab + params.id!);
      return Right(CategoriesTabModel.fromJson(response));
    }  catch (e) {
      if (e is DioException){
        return Left(ServerFailure.fromServer(e));
      }else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}

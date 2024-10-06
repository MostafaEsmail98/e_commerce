import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteAllCategories/remote_all_categories.dart';
import 'package:e_commrece/features/home/data/models/categories_model.dart';

import '../../../../../core/errors/exceptions.dart';

class RemoteAllCategoriesImpl extends RemoteAllCategories {
  ApiConsumer api;

  RemoteAllCategoriesImpl({required this.api});

  @override
  Future<Either<ErrorModel, CategoriesModel>> getAllCategories() async {
    try {
      var response = await api.get(Endpoints.categories);
      return Right(CategoriesModel.fromJson(response));
    } on ServerExceptions catch (e) {
      return Left(ErrorModel(errMassage: e.errorModel.errMassage));
    }
  }
}

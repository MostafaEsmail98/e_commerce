import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteCategoriesTab/remote_categories_tab.dart';
import 'package:e_commrece/features/home/data/models/categories_tab_model.dart';

import '../../../../../core/errors/exceptions.dart';

class RemoteCategoriesTabImpl extends RemoteCategoriesTab {
  ApiConsumer api;

  RemoteCategoriesTabImpl({required this.api});

  @override
  Future<Either<ErrorModel, CategoriesTabModel>> getCategories(
      CategoriesTabParams params) async {
    try {
      var response = await api.get(Endpoints.categoriesTab + params.id!);
      return Right(CategoriesTabModel.fromJson(response));
    } on ServerExceptions catch (e) {
      return Left(ErrorModel(errMassage: e.errorModel.errMassage));
    }
  }
}

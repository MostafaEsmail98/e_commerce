import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/home/domain/entity/categories_tab_entity.dart';

import '../../../../core/params/params.dart';

abstract class CategoriesTabRepo {
  Future<Either<ErrorModel,CategoriesTabEntity>> getCategories (CategoriesTabParams params);
}
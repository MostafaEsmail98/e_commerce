import 'package:dartz/dartz.dart';
import 'package:e_commrece/features/home/domain/entity/categories_tab_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/params.dart';

abstract class CategoriesTabRepo {
  Future<Either<Failure,CategoriesTabEntity>> getCategories (CategoriesTabParams params);
}
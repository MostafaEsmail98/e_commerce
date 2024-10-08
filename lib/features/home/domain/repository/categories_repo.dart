import 'package:dartz/dartz.dart';
import 'package:e_commrece/features/home/domain/entity/categories_entity.dart';

import '../../../../core/errors/exceptions.dart';

abstract class CategoriesRepo {
  Future<Either<Failure,CategoriesEntity>> getAllCategories();
}
import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/home/domain/entity/categories_entity.dart';

abstract class CategoriesRepo {
  Future<Either<ErrorModel,CategoriesEntity>> getAllCategories();
}
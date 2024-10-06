import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/home/domain/entity/categories_entity.dart';
import 'package:e_commrece/features/home/domain/repository/categories_repo.dart';

class CategoriesUseCase {
  CategoriesRepo categoriesRepo ;

  CategoriesUseCase({required this.categoriesRepo});

  Future<Either<ErrorModel,CategoriesEntity>> call(){
    return categoriesRepo.getAllCategories();
  }
}
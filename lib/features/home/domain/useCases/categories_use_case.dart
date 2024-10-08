import 'package:dartz/dartz.dart';
import 'package:e_commrece/features/home/domain/entity/categories_entity.dart';
import 'package:e_commrece/features/home/domain/repository/categories_repo.dart';

import '../../../../core/errors/exceptions.dart';

class CategoriesUseCase {
  CategoriesRepo categoriesRepo ;

  CategoriesUseCase({required this.categoriesRepo});

  Future<Either<Failure,CategoriesEntity>> call()async {
    return await categoriesRepo.getAllCategories();
  }
}
import 'package:dartz/dartz.dart';
import 'package:e_commrece/features/home/domain/entity/categories_tab_entity.dart';
import 'package:e_commrece/features/home/domain/repository/categories_tab_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/params.dart';

class CategoriesTabUseCase {
  CategoriesTabRepo categoriesTabRepo ;

  CategoriesTabUseCase({required this.categoriesTabRepo});

 Future<Either<Failure,CategoriesTabEntity>> call(CategoriesTabParams params)async{
    return await categoriesTabRepo.getCategories(params);
  }
}
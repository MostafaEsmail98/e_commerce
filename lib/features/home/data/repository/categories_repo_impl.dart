import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteAllCategories/remote_all_categories.dart';
import 'package:e_commrece/features/home/domain/entity/categories_entity.dart';
import 'package:e_commrece/features/home/domain/repository/categories_repo.dart';

class CategoriesRepoImpl extends CategoriesRepo{
  RemoteAllCategories remoteAllCategories ;


  CategoriesRepoImpl({required this.remoteAllCategories});

  @override
  Future<Either<ErrorModel, CategoriesEntity>> getAllCategories() async {
    return await remoteAllCategories.getAllCategories();
  }




}
import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteCategoriesTab/remote_categories_tab.dart';
import 'package:e_commrece/features/home/domain/entity/categories_tab_entity.dart';
import 'package:e_commrece/features/home/domain/repository/categories_tab_repo.dart';

import '../../../../core/errors/exceptions.dart';

class CategoriesTabRepoImpl extends CategoriesTabRepo{
  RemoteCategoriesTab remoteCategoriesTab ;

  CategoriesTabRepoImpl({required this.remoteCategoriesTab});

  @override
  Future<Either<Failure, CategoriesTabEntity>> getCategories(CategoriesTabParams params) async{
    return await remoteCategoriesTab.getCategories(params);
  }

}
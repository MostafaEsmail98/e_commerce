import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/categories_tab_model.dart';

abstract class RemoteCategoriesTab {
  Future<Either<ErrorModel,CategoriesTabModel>>getCategories(CategoriesTabParams params);
}
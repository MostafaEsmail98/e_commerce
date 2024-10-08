import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/categories_tab_model.dart';

abstract class RemoteCategoriesTab {
  Future<Either<Failure,CategoriesTabModel>>getCategories(CategoriesTabParams params);
}
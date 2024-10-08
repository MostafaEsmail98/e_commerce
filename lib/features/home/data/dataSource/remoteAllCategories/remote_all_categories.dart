import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';

import '../../models/categories_model.dart';

abstract class RemoteAllCategories {




  Future<Either<Failure, CategoriesModel>> getAllCategories() ;
}
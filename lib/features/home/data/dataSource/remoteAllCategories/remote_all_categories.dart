import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../models/categories_model.dart';

abstract class RemoteAllCategories {




  Future<Either<ErrorModel, CategoriesModel>> getAllCategories() ;
}
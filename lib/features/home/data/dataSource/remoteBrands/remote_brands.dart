import 'package:dartz/dartz.dart';
import 'package:e_commrece/features/home/data/models/brands_model.dart';

import '../../../../../core/errors/error_model.dart';

abstract class RemoteBrands {
  Future<Either<ErrorModel, BrandsModel>> getBrands();
}

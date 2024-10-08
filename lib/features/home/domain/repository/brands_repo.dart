import 'package:dartz/dartz.dart';
import 'package:e_commrece/features/home/domain/entity/brands_entity.dart';

import '../../../../core/errors/exceptions.dart';

abstract class BrandsRepo {
  Future <Either<Failure,BrandsEntity>> getBrands ();
}
import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/home/domain/entity/brands_entity.dart';

abstract class BrandsRepo {
  Future <Either<ErrorModel,BrandsEntity>> getBrands ();
}
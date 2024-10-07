import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/domain/entity/specific_product_entity.dart';

abstract class SpecificProductRepo {
  Future<Either<ErrorModel,SpecificProductEntity>> getSpecificProduct(ProductParams params);
}
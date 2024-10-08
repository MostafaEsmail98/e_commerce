import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/domain/entity/specific_product_entity.dart';

import '../../../../core/errors/exceptions.dart';

abstract class SpecificProductRepo {
  Future<Either<Failure,SpecificProductEntity>> getSpecificProduct(ProductParams params);
}
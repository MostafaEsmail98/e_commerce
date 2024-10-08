import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/domain/entity/all_product_entity.dart';

import '../../../../core/errors/exceptions.dart';

abstract class AllProductRepo {
  Future<Either<Failure,AllProductEntity>> getAllProduct(AllProductParams params);
}
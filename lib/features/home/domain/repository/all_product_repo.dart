import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/domain/entity/all_product_entity.dart';

abstract class AllProductRepo {
  Future<Either<ErrorModel,AllProductEntity>> getAllProduct(AllProductParams params);
}
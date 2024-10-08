import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/specific_product_model.dart';

abstract class RemoteSpecificProduct {
  Future<Either<Failure, SpecificProductModel>> getSpecificProduct(ProductParams params);
}

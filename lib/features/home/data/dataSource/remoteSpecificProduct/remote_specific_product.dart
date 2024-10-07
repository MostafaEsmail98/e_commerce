import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/specific_product_model.dart';

abstract class RemoteSpecificProduct {
  Future<Either<ErrorModel, SpecificProductModel>> getSpecificProduct(ProductParams params);
}

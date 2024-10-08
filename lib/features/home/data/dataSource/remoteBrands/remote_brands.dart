import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/features/home/data/models/brands_model.dart';


abstract class RemoteBrands {
  Future<Either<Failure, BrandsModel>> getBrands();
}

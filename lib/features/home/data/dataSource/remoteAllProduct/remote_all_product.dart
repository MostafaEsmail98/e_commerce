import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/all_product_model.dart';

import '../../../../../core/errors/error_model.dart';

abstract class RemoteAllProduct {


  Future<Either<ErrorModel, AllProductModel>> getAllProduct(AllProductParams params) ;
}
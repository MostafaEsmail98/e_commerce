import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/all_product_model.dart';


abstract class RemoteAllProduct {


  Future<Either<Failure, AllProductModel>> getAllProduct(AllProductParams params) ;
}
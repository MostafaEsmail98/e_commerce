import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/domain/entity/all_product_entity.dart';
import 'package:e_commrece/features/home/domain/repository/all_product_repo.dart';

class AllProductUseCase {
  AllProductRepo allProductRepo ;

  AllProductUseCase({required this.allProductRepo});

  Future<Either<ErrorModel,AllProductEntity>>call (AllProductParams params){
    return allProductRepo.getAllProduct(params);
  }
}
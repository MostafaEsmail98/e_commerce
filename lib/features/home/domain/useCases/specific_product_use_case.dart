import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/domain/entity/specific_product_entity.dart';
import 'package:e_commrece/features/home/domain/repository/specific_product_repo.dart';

class SpecificProductUseCase {
  SpecificProductRepo specificProductRepo;

  SpecificProductUseCase({required this.specificProductRepo});

  Future<Either<ErrorModel, SpecificProductEntity>> call(
      ProductParams params) async {
    return await specificProductRepo.getSpecificProduct(params);
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/domain/entity/specific_product_entity.dart';
import 'package:e_commrece/features/home/domain/repository/specific_product_repo.dart';

import '../../../../core/errors/exceptions.dart';

class SpecificProductUseCase {
  SpecificProductRepo specificProductRepo;

  SpecificProductUseCase({required this.specificProductRepo});

  Future<Either<Failure, SpecificProductEntity>> call(
      ProductParams params) async {
    return await specificProductRepo.getSpecificProduct(params);
  }
}

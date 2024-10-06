import 'package:dartz/dartz.dart';
import 'package:e_commrece/features/home/domain/entity/brands_entity.dart';
import 'package:e_commrece/features/home/domain/repository/brands_repo.dart';

import '../../../../core/errors/error_model.dart';

class BrandsUseCase {
  BrandsRepo brandsRepo;

  BrandsUseCase({required this.brandsRepo});

  Future<Either<ErrorModel, BrandsEntity>> call() async {
    return await brandsRepo.getBrands();
  }
}

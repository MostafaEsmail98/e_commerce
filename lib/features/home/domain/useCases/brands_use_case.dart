import 'package:dartz/dartz.dart';
import 'package:e_commrece/features/home/domain/entity/brands_entity.dart';
import 'package:e_commrece/features/home/domain/repository/brands_repo.dart';

import '../../../../core/errors/exceptions.dart';

class BrandsUseCase {
  BrandsRepo brandsRepo;

  BrandsUseCase({required this.brandsRepo});

  Future<Either<Failure, BrandsEntity>> call() async {
    return await brandsRepo.getBrands();
  }
}

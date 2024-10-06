import 'package:dartz/dartz.dart';

import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteBrands/remote_brands.dart';

import 'package:e_commrece/features/home/domain/entity/brands_entity.dart';

import '../../domain/repository/brands_repo.dart';

class BrandsRepoImpl extends BrandsRepo{
  RemoteBrands remoteBrands ;

  BrandsRepoImpl({required this.remoteBrands});

  @override
  Future<Either<ErrorModel, BrandsEntity>> getBrands() async{
    return await remoteBrands.getBrands();
  }

}
import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteSpecificProduct/remote_specific_product.dart';
import 'package:e_commrece/features/home/domain/entity/specific_product_entity.dart';
import 'package:e_commrece/features/home/domain/repository/specific_product_repo.dart';

class SpecificProductRepoImpl extends SpecificProductRepo {
  RemoteSpecificProduct remoteSpecificProduct;

  SpecificProductRepoImpl({required this.remoteSpecificProduct});

  @override
  Future<Either<ErrorModel, SpecificProductEntity>> getSpecificProduct(
      ProductParams params) async {
    return await remoteSpecificProduct.getSpecificProduct(params);
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteAllProduct/remote_all_product.dart';
import 'package:e_commrece/features/home/domain/entity/all_product_entity.dart';
import 'package:e_commrece/features/home/domain/repository/all_product_repo.dart';

class AllProductRepoImpl extends AllProductRepo{
  RemoteAllProduct remoteAllProduct;

  AllProductRepoImpl({required this.remoteAllProduct});

  @override
  Future<Either<Failure, AllProductEntity>> getAllProduct(AllProductParams params) async{
    return await remoteAllProduct.getAllProduct(params);
  }

}
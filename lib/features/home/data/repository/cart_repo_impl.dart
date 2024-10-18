import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteCart/remote_cart.dart';
import 'package:e_commrece/features/home/data/models/checkout_model.dart';
import 'package:e_commrece/features/home/domain/entity/cart_entity.dart';
import 'package:e_commrece/features/home/domain/repository/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  RemoteCart remoteCart ;

  CartRepoImpl({required this.remoteCart});

  @override
  Future<Either<Failure, CartEntity>> getCart() async{
    return await remoteCart.getCart();
  }

  @override
  Future<Either<Failure, CartEntity>> countCart(CartParams params)async {
  return remoteCart.countCart(params);
  }

  @override
  Future<Either<Failure, CartEntity>> deleteCart(CartParams params) async{
  return await remoteCart.deleteCart(params);
  }

  @override
  Future<Either<Failure, String>> addCart(CartParams params) async{
    return await remoteCart.addCart(params);
  }

  @override
  Future<Either<Failure, CheckoutModel>> checkout(String id) async{
    return await remoteCart.checkout(id);
  }


}
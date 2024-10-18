import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/checkout_model.dart';

import 'package:e_commrece/features/home/domain/entity/cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failure,CartEntity>> getCart();
  Future<Either<Failure,CartEntity>> countCart(CartParams params);
  Future<Either<Failure,CartEntity>> deleteCart(CartParams params);
  Future<Either<Failure,String>> addCart(CartParams params);
  Future<Either<Failure,CheckoutModel>> checkout(String id);
}
import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/cart_model.dart';
import 'package:e_commrece/features/home/data/models/checkout_model.dart';


abstract class RemoteCart {
  Future<Either<Failure,CartModel>>getCart();
  Future<Either<Failure,CartModel>>countCart(CartParams params);
  Future<Either<Failure,CartModel>>deleteCart(CartParams params);
  Future<Either<Failure,String>>addCart(CartParams params);
  Future<Either<Failure,CheckoutModel>>checkout(String id);
}
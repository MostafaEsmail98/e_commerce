import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/checkout_model.dart';
import 'package:e_commrece/features/home/domain/entity/cart_entity.dart';
import 'package:e_commrece/features/home/domain/repository/cart_repo.dart';

class CartUseCase {
  CartRepo cartRepo;

  CartUseCase({required this.cartRepo});

  Future<Either<Failure, CartEntity>> callCart() async {
    return await cartRepo.getCart();
  }

  Future<Either<Failure, CartEntity>> callCount(CartParams params) async {
    return await cartRepo.countCart(params);
  }

  Future<Either<Failure, CartEntity>> callDelete(CartParams params) async {
    return await cartRepo.deleteCart(params);
  }

  Future<Either<Failure, String>> callAdd(CartParams params) async {
    return await cartRepo.addCart(params);
  }

  Future<Either<Failure, CheckoutModel>> callCheckout(String id) async {
    return await cartRepo.checkout(id);
  }
}

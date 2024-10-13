import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteCart/remote_cart.dart';
import 'package:e_commrece/features/home/data/models/cart_model.dart';



class RemoteCartImpl extends RemoteCart {
  ApiConsumer api;

  RemoteCartImpl({required this.api});

  @override
  Future<Either<Failure, CartModel>> getCart() async {
    try {
      var response = await api.get(Endpoints.cart);
      return Right(CartModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromServer(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartModel>> countCart(CartParams params) async {
    try {
      var response = await api.put(Endpoints.cart +"/"+ params.productId!,
          data: {"count": params.count.toString()});
      return Right(CartModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromServer(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartModel>> deleteCart(CartParams params)async {
    try {
      var response = await api.delete(Endpoints.cart +"/"+ params.productId!);
      return Right(CartModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromServer(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> addCart(CartParams params)async {
    try {
      var response = await api.post(Endpoints.cart ,data: {
        "productId":params.productId
      });
      return Right(response["message"]);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromServer(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}

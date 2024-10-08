import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/endpoints.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteGetWishlist/remote_get_wishlist.dart';
import 'package:e_commrece/features/home/data/models/post_wishlist_model.dart';
import 'package:e_commrece/features/home/data/models/get_wishlist_model.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../models/delete_wishlist_model.dart';

class RemoteGetWishlistImpl extends RemoteGetWishlist{
  ApiConsumer api ;

  RemoteGetWishlistImpl({required this.api});

  @override
  Future<Either<ErrorModel, GetWishlistModel>> getWishlist() async{
    try {
      var response = await api.get(Endpoints.wishlist);
      return Right(GetWishlistModel.fromJson(response));
    } on ServerExceptions catch (e) {
      return Left(ErrorModel(errMassage: e.errorModel.errMassage));
    }
  }

  @override
  Future<Either<ErrorModel, PostWishlistModel>> postWishlist(PostWishlistParams params) async{
    try {
      var response = await api.post(Endpoints.wishlist,data: {
        ApiKey.productId:params.productId
      });
      return Right(PostWishlistModel.fromJson(response));
    } on ServerExceptions catch (e) {
      return Left(ErrorModel(errMassage: e.errorModel.errMassage));
    }
  }

  @override
  Future<Either<ErrorModel, DeleteWishlistModel>> deleteWishlist(PostWishlistParams params) async{
    try {
      var response = await api.delete(Endpoints.wishlist+"/"+params.productId!);
      return Right(DeleteWishlistModel.fromJson(response));
    } on ServerExceptions catch (e) {
      return Left(ErrorModel(errMassage: e.errorModel.errMassage));
    }
  }
  
}
import 'package:dartz/dartz.dart';

import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteGetWishlist/remote_get_wishlist.dart';
import 'package:e_commrece/features/home/data/models/delete_wishlist_model.dart';
import 'package:e_commrece/features/home/data/models/post_wishlist_model.dart';

import 'package:e_commrece/features/home/domain/entity/get_wishlist_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repository/get_wishlist_repo.dart';

class GetWishlistRepoImpl extends GetWishlistRepo {
  RemoteGetWishlist remoteGetWishlist ;

  GetWishlistRepoImpl({required this.remoteGetWishlist});

  @override
  Future<Either<Failure, GetWishlistEntity>> getWishlist() async{
    return await remoteGetWishlist.getWishlist();
  }

  @override
  Future<Either<Failure, PostWishlistModel>> postWishlist(PostWishlistParams params) async{

    return await remoteGetWishlist.postWishlist(params);
  }

  @override
  Future<Either<Failure, DeleteWishlistModel>> deleteWishlist(PostWishlistParams params) async{
    return await remoteGetWishlist.deleteWishlist(params);
  }



}
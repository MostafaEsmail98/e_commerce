import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/post_wishlist_model.dart';
import 'package:e_commrece/features/home/domain/entity/get_wishlist_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../data/models/delete_wishlist_model.dart';

abstract class GetWishlistRepo {
  Future<Either<Failure,GetWishlistEntity>> getWishlist();
  Future<Either<Failure,PostWishlistModel>> postWishlist(PostWishlistParams params);
  Future<Either<Failure,DeleteWishlistModel>> deleteWishlist(PostWishlistParams params);
}
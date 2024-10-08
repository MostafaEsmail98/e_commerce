import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/post_wishlist_model.dart';
import 'package:e_commrece/features/home/domain/entity/get_wishlist_entity.dart';

import '../../data/models/delete_wishlist_model.dart';

abstract class GetWishlistRepo {
  Future<Either<ErrorModel,GetWishlistEntity>> getWishlist();
  Future<Either<ErrorModel,PostWishlistModel>> postWishlist(PostWishlistParams params);
  Future<Either<ErrorModel,DeleteWishlistModel>> deleteWishlist(PostWishlistParams params);
}
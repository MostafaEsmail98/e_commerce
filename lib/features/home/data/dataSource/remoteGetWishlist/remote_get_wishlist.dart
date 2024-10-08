import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/get_wishlist_model.dart';

import '../../models/delete_wishlist_model.dart';
import '../../models/post_wishlist_model.dart';

abstract class RemoteGetWishlist {
  Future<Either<ErrorModel,GetWishlistModel>>getWishlist();
  Future<Either<ErrorModel,PostWishlistModel>>postWishlist(PostWishlistParams params);
  Future<Either<ErrorModel,DeleteWishlistModel>>deleteWishlist(PostWishlistParams params);
}
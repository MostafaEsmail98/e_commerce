import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/get_wishlist_model.dart';

import '../../models/delete_wishlist_model.dart';
import '../../models/post_wishlist_model.dart';

abstract class RemoteGetWishlist {
  Future<Either<Failure,GetWishlistModel>>getWishlist();
  Future<Either<Failure,PostWishlistModel>>postWishlist(PostWishlistParams params);
  Future<Either<Failure,DeleteWishlistModel>>deleteWishlist(PostWishlistParams params);
}
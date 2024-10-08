import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/post_wishlist_model.dart';
import 'package:e_commrece/features/home/domain/entity/get_wishlist_entity.dart';
import 'package:e_commrece/features/home/domain/repository/get_wishlist_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../data/models/delete_wishlist_model.dart';

class GetWishlistUseCase {
  GetWishlistRepo getWishlistRepo;

  GetWishlistUseCase({required this.getWishlistRepo});

  Future<Either<Failure, GetWishlistEntity>> call() async {
    return await getWishlistRepo.getWishlist();
  }

  Future<Either<Failure, PostWishlistModel>> postCall(
      PostWishlistParams params) async {
    return await getWishlistRepo.postWishlist(params);
  } Future<Either<Failure, DeleteWishlistModel>> deleteCall(
      PostWishlistParams params) async {
    return await getWishlistRepo.deleteWishlist(params);
  }
}

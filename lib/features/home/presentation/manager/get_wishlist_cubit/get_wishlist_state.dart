part of 'get_wishlist_cubit.dart';

class GetWishlistState {}

final class GetWishlistInitial extends GetWishlistState {}

final class GetWishlistLoading extends GetWishlistState {}

final class GetWishlistSuccessful extends GetWishlistState {
  GetWishlistEntity getWishlistEntity;

  GetWishlistSuccessful(this.getWishlistEntity);
}

final class GetWishlistFailure extends GetWishlistState {
  ErrorModel errorModel;

  GetWishlistFailure(this.errorModel);
}

final class PostWishlistLoading extends GetWishlistState {}


final class PostWishlistSuccessful extends GetWishlistState {
  PostWishlistModel postWishlistModel;

  PostWishlistSuccessful(this.postWishlistModel);
}

final class PostWishlistFailure extends GetWishlistState {
  ErrorModel errorModel ;

  PostWishlistFailure(this.errorModel);
}final class DeleteWishlistLoading extends GetWishlistState {}


final class DeleteWishlistSuccessful extends GetWishlistState {
  DeleteWishlistModel deleteWishlistModel;

  DeleteWishlistSuccessful(this.deleteWishlistModel);
}

final class DeleteWishlistFailure extends GetWishlistState {
  ErrorModel errorModel ;

  DeleteWishlistFailure(this.errorModel);
}

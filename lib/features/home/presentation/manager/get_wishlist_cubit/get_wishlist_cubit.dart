import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteGetWishlist/remote_get_wishlist_impl.dart';
import 'package:e_commrece/features/home/data/models/post_wishlist_model.dart';
import 'package:e_commrece/features/home/data/repository/get_wishlist_repo_impl.dart';
import 'package:e_commrece/features/home/domain/entity/get_wishlist_entity.dart';
import 'package:e_commrece/features/home/domain/useCases/get_wishlist_use_case.dart';

import '../../../data/models/delete_wishlist_model.dart';

part 'get_wishlist_state.dart';

class GetWishlistCubit extends Cubit<GetWishlistState> {
  GetWishlistCubit() : super(GetWishlistInitial());

  getWishlist() async {
    emit(GetWishlistLoading());
    var response = await GetWishlistUseCase(
            getWishlistRepo: GetWishlistRepoImpl(
                remoteGetWishlist:
                    RemoteGetWishlistImpl(api: DioConsumer(dio: Dio()))))
        .call();
    response.fold((failure) => emit(GetWishlistFailure(failure)),
        (result) => emit(GetWishlistSuccessful(result)));
  }

  postWishlist(PostWishlistParams params) async {
    emit(PostWishlistLoading());
    var response = await GetWishlistUseCase(
            getWishlistRepo: GetWishlistRepoImpl(
                remoteGetWishlist:
                    RemoteGetWishlistImpl(api: DioConsumer(dio: Dio()))))
        .postCall(params);
    response.fold((failure) => emit(PostWishlistFailure(failure)),
        (result) => emit(PostWishlistSuccessful(result)));
  }

  deleteWishlist(PostWishlistParams params) async {
    emit(DeleteWishlistLoading());
    var response = await GetWishlistUseCase(
            getWishlistRepo: GetWishlistRepoImpl(
                remoteGetWishlist:
                    RemoteGetWishlistImpl(api: DioConsumer(dio: Dio()))))
        .deleteCall(params);
    getWishlist();
    response.fold((failure) => emit(DeleteWishlistFailure(failure)),
        (result) => emit(DeleteWishlistSuccessful(result)));
  }
}

import 'package:bloc/bloc.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/core/utils/services_locator.dart';
import 'package:e_commrece/features/home/data/models/post_wishlist_model.dart';
import 'package:e_commrece/features/home/domain/entity/get_wishlist_entity.dart';
import 'package:e_commrece/features/home/domain/useCases/get_wishlist_use_case.dart';

import '../../../data/models/delete_wishlist_model.dart';

part 'get_wishlist_state.dart';

class GetWishlistCubit extends Cubit<GetWishlistState> {
  GetWishlistCubit() : super(GetWishlistInitial());

  getWishlist() async {
    emit(GetWishlistLoading());
    var response = await getIt.get<GetWishlistUseCase>().call();
    response.fold((failure) => emit(GetWishlistFailure(failure.message)),
        (result) => emit(GetWishlistSuccessful(result)));
  }

  postWishlist(PostWishlistParams params) async {
    emit(PostWishlistLoading());
    var response = await getIt.get<GetWishlistUseCase>().postCall(params);
    response.fold((failure) => emit(PostWishlistFailure(failure.message)),
        (result) => emit(PostWishlistSuccessful(result)));
  }

  deleteWishlist(PostWishlistParams params) async {
    emit(DeleteWishlistLoading());
    var response = await getIt.get<GetWishlistUseCase>().deleteCall(params);
    getWishlist();
    response.fold((failure) => emit(DeleteWishlistFailure(failure.message)),
        (result) => emit(DeleteWishlistSuccessful(result)));
  }
}

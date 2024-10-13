import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteCart/remote_cart_impl.dart';
import 'package:e_commrece/features/home/data/repository/cart_repo_impl.dart';
import 'package:e_commrece/features/home/domain/entity/cart_entity.dart';
import 'package:e_commrece/features/home/domain/useCases/cart_use_case.dart';


part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  int count = 0 ;
  getCart() async {
    emit(CartLoading());
    var response = await CartUseCase(
            cartRepo: CartRepoImpl(
                remoteCart: RemoteCartImpl(api: DioConsumer(dio: Dio()))))
        .callCart();
    response.fold((failure) => emit(CartFailure(failure.message)),
        (result) => emit(CartSuccessful(result)));
  }

  countCart(CartParams params) async {
    emit(CartLoading());
    var response = await CartUseCase(
            cartRepo: CartRepoImpl(
                remoteCart: RemoteCartImpl(api: DioConsumer(dio: Dio()))))
        .callCount(params);
    response.fold((failure) => emit(CartFailure(failure.message)),
        (result) => emit(CartSuccessful(result)));
  }

  deleteCart(CartParams params) async {
    emit(CartLoading());
    var response = await CartUseCase(
            cartRepo: CartRepoImpl(
                remoteCart: RemoteCartImpl(api: DioConsumer(dio: Dio()))))
        .callDelete(params);
    response.fold((failure) => emit(CartFailure(failure.message)),
        (result) => emit(CartSuccessful(result)));
  }

  addCart(CartParams params) async {
    emit(CartLoading());
    var response = await CartUseCase(
            cartRepo: CartRepoImpl(
                remoteCart: RemoteCartImpl(api: DioConsumer(dio: Dio()))))
        .callAdd(params);
    response.fold((failure) {
      emit(CartAddFailure(failure.message));
    }, (result) => emit(CartAddSuccessful(result)));
  }
}

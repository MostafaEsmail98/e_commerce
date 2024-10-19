import 'package:bloc/bloc.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/core/utils/services_locator.dart';
import 'package:e_commrece/features/home/data/models/checkout_model.dart';
import 'package:e_commrece/features/home/domain/entity/cart_entity.dart';
import 'package:e_commrece/features/home/domain/useCases/cart_use_case.dart';
import 'package:url_launcher/url_launcher.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  int count = 0;
  late Uri _url ;
  late String id;

  getCart() async {
    emit(CartLoading());
    var response = await getIt.get<CartUseCase>().callCart();
    response.fold((failure) => emit(CartFailure(failure.message)), (result) {
      id = result.cartId!;
      emit(CartSuccessful(result));
    });
  }

  countCart(CartParams params) async {
    emit(CartLoading());
    var response = await  getIt.get<CartUseCase>().callCount(params);
    response.fold((failure) => emit(CartFailure(failure.message)),
        (result) => emit(CartSuccessful(result)));
  }

  deleteCart(CartParams params) async {
    emit(CartLoading());
    var response = await  getIt.get<CartUseCase>().callDelete(params);
    response.fold((failure) => emit(CartFailure(failure.message)),
        (result) => emit(CartSuccessful(result)));
  }

  addCart(CartParams params) async {
    emit(CartLoading());
    var response = await  getIt.get<CartUseCase>().callAdd(params);
    response.fold((failure) {
      emit(CartAddFailure(failure.message));
    }, (result) => emit(CartAddSuccessful(result)));
  }

  checkout() async {
    emit(CheckoutLoading());
    var response = await  getIt.get<CartUseCase>().callCheckout(id);
    response.fold((failure) {
      emit(CheckoutFailure(failure.message));
    }, (result) async {

      emit(CheckoutSuccessful(result));_url = Uri.parse(result.session!.url!) ;
    });
  }

  Future<void> launch() async {
    await checkout();
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
    getCart();
  }
}

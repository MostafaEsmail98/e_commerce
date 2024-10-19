import 'package:bloc/bloc.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/core/utils/services_locator.dart';
import 'package:e_commrece/features/home/domain/entity/all_product_entity.dart';
import 'package:e_commrece/features/home/domain/useCases/all_product_use_case.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit() : super(AllProductInitial());

  getAllProduct(AllProductParams params) async{
    emit(AllProductLoading());
    var response =await getIt.get<AllProductUseCase>().call(params);
    response.fold((failure) => emit(AllProductFailure(failure.message)),
            (result) => emit(AllProductSuccessful(result)));
  }

}

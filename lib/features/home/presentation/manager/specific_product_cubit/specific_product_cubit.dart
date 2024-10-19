import 'package:bloc/bloc.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/core/utils/services_locator.dart';
import 'package:e_commrece/features/home/domain/useCases/specific_product_use_case.dart';
import '../../../domain/entity/specific_product_entity.dart';
part 'specific_product_state.dart';

class SpecificProductCubit extends Cubit<SpecificProductState> {
  SpecificProductCubit() : super(SpecificProductInitial());

  getSpecificProduct(ProductParams params) async {
    emit(SpecificProductLoading());
    var response = await getIt.get<SpecificProductUseCase>().call(params);
    response.fold((failure) => emit(SpecificProductFailure(failure.message)),
        (result) => emit(SpecificProductSuccessful(result)));
  }
}

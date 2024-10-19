import 'package:bloc/bloc.dart';
import 'package:e_commrece/features/home/domain/entity/brands_entity.dart';
import 'package:e_commrece/features/home/domain/useCases/brands_use_case.dart';
import '../../../../../core/utils/services_locator.dart';
part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit() : super(BrandsInitial());

  getBrands() async {
    emit(BrandsLoading());
    var response = await getIt.get<BrandsUseCase>().call();
    response.fold((failure) => emit(BrandsFailure(failure.message)),
        (result) => emit(BrandsSuccessful(result)));
  }
}

import 'package:bloc/bloc.dart';
import 'package:e_commrece/core/utils/services_locator.dart';
import 'package:e_commrece/features/home/domain/entity/categories_entity.dart';
import 'package:e_commrece/features/home/domain/useCases/categories_use_case.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());


  getAllCategories() async {
    emit(CategoriesLoading());
    var response = await getIt.get<CategoriesUseCase>().call();
    response.fold((failure) => emit(CategoriesFailure(failure.message)),
        (result) => emit(CategoriesSuccessful(result)));
  }
}

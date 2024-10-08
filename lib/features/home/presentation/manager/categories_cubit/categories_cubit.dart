import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteAllCategories/remote_all_categories_impl.dart';
import 'package:e_commrece/features/home/data/repository/categories_repo_impl.dart';
import 'package:e_commrece/features/home/domain/entity/categories_entity.dart';
import 'package:e_commrece/features/home/domain/useCases/categories_use_case.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());


  getAllCategories() async {
    emit(CategoriesLoading());
    var response = await CategoriesUseCase(
            categoriesRepo: CategoriesRepoImpl(
                remoteAllCategories:
                    RemoteAllCategoriesImpl(api: DioConsumer(dio: Dio()))))
        .call();
    response.fold((failure) => emit(CategoriesFailure(failure)),
        (result) => emit(CategoriesSuccessful(result)));
  }
}

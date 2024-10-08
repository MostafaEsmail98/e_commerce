import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteCategoriesTab/remote_categories_tab_impl.dart';
import 'package:e_commrece/features/home/data/repository/categories_tab_repo_impl.dart';
import 'package:e_commrece/features/home/domain/entity/categories_tab_entity.dart';
import 'package:e_commrece/features/home/domain/useCases/categories_tab_use_case.dart';


part 'categories_tab_state.dart';

class CategoriesTabCubit extends Cubit<CategoriesTabState> {
  CategoriesTabCubit() : super(CategoriesTabInitial());
  late int active = 1;
  getCategoriesTab(CategoriesTabParams params) async {
    emit(CategoriesTabLoading());
    var response = await CategoriesTabUseCase(
        categoriesTabRepo: CategoriesTabRepoImpl(
            remoteCategoriesTab: RemoteCategoriesTabImpl(
                api: DioConsumer(dio: Dio())))).call(params);
    response.fold((failure) => emit(CategoriesTabFailure(failure.message)), (result) =>
        emit(CategoriesTabSuccessful(result)));
  }
}

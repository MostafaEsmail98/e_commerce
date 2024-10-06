import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteBrands/remote_brands_impl.dart';
import 'package:e_commrece/features/home/data/repository/brands_repo_impl.dart';
import 'package:e_commrece/features/home/domain/entity/brands_entity.dart';
import 'package:e_commrece/features/home/domain/useCases/brands_use_case.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit() : super(BrandsInitial());

  getBrands() async {
    emit(BrandsLoading());
    var response = await BrandsUseCase(
            brandsRepo: BrandsRepoImpl(
                remoteBrands: RemoteBrandsImpl(api: DioConsumer(dio: Dio()))))
        .call();
    response.fold((failure) => emit(BrandsFailure(failure)),
        (result) => emit(BrandsSuccessful(result)));
  }
}

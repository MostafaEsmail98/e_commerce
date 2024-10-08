import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteSpecificProduct/remote_specific_product_impl.dart';
import 'package:e_commrece/features/home/data/repository/specific_product_repo_impl.dart';
import 'package:e_commrece/features/home/domain/useCases/specific_product_use_case.dart';
import '../../../domain/entity/specific_product_entity.dart';

part 'specific_product_state.dart';

class SpecificProductCubit extends Cubit<SpecificProductState> {
  SpecificProductCubit() : super(SpecificProductInitial());

  getSpecificProduct(ProductParams params) async {
    emit(SpecificProductLoading());
    var response = await SpecificProductUseCase(
            specificProductRepo: SpecificProductRepoImpl(
                remoteSpecificProduct:
                    RemoteSpecificProductImpl(api: DioConsumer(dio: Dio()))))
        .call(params);
    response.fold((failure) => emit(SpecificProductFailure(failure.message)),
        (result) => emit(SpecificProductSuccessful(result)));
  }
}

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteAllProduct/remote_all_product_impl.dart';
import 'package:e_commrece/features/home/data/repository/all_product_repo_impl.dart';
import 'package:e_commrece/features/home/domain/entity/all_product_entity.dart';
import 'package:e_commrece/features/home/domain/useCases/all_product_use_case.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit() : super(AllProductInitial());

  getAllProduct(BrandsParams params) async{
    emit(AllProductLoading());
    var response =await AllProductUseCase(allProductRepo: AllProductRepoImpl(
        remoteAllProduct: RemoteAllProductImpl(api: DioConsumer(dio: Dio())))).call(params);
    response.fold((failure) => emit(AllProductFailure(failure)),
            (result) => emit(AllProductSuccessful(result)));
  }

}

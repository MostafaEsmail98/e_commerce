import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataVerifyCode/remote_verify_code_impl.dart';
import 'package:e_commrece/features/auth/data/repositery/verify_code_repo_impl.dart';
import 'package:e_commrece/features/auth/domain/entities/verify_code_entity.dart';
import 'package:e_commrece/features/auth/domain/usesCase/verify_code_use_cases.dart';
import 'package:flutter/material.dart';


part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  VerifyCodeCubit() : super(VerifyCodeInitial());

  postVerifyCode() async {
    emit(VerifyCodeLoading());
    var response = await VerifyCodeUseCases(
            verifyCodeRepo: VerifyCodeRepoImpl(
                remoteVerifyCode:
                    RemoteVerifyCodeImpl(api: DioConsumer(dio: Dio()))))
        .call(params: VerifyCodeParams(resetCode: codeController.text));
    response.fold(
      (failure) => emit(VerifyCodeFailure(failure.message)),
      (code) => emit(VerifyCodeSuccessful(code)),
    );
  }
}

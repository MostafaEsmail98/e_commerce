import 'package:bloc/bloc.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/verify_code_entity.dart';
import 'package:e_commrece/features/auth/domain/usesCase/verify_code_use_cases.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/services_locator.dart';


part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  VerifyCodeCubit() : super(VerifyCodeInitial());

  postVerifyCode() async {
    emit(VerifyCodeLoading());
    var response = await getIt.get<VerifyCodeUseCases>()
        .call(params: VerifyCodeParams(resetCode: codeController.text));
    response.fold(
      (failure) => emit(VerifyCodeFailure(failure.message)),
      (code) => emit(VerifyCodeSuccessful(code)),
    );
  }
}

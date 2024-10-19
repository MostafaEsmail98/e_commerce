import 'package:bloc/bloc.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/core/utils/services_locator.dart';
import 'package:e_commrece/features/auth/domain/entities/forget_password_entity.dart';
import 'package:e_commrece/features/auth/domain/usesCase/forget_password_use_cases.dart';
import 'package:flutter/material.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  postForgetPasswordUser() async {
    emit(ForgetPasswordLoading());
    var response = await getIt.get<ForgetPasswordUseCases>()
        .call(params: ForgetPasswordParams(email: emailController.text));
    response.fold(
      (failure) => emit(ForgetPasswordFailure(failure.message)),
      (user) => emit(ForgetPasswordSuccessful(user)),
    );
  }
}

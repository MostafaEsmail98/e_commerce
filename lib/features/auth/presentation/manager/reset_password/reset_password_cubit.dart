import 'package:bloc/bloc.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/core/utils/services_locator.dart';
import 'package:e_commrece/features/auth/domain/entities/reset_password_entity.dart';
import 'package:e_commrece/features/auth/domain/usesCase/reset_password_use_cases.dart';
import 'package:flutter/cupertino.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  resetPassword() async {
    emit(ResetPasswordLoading());
    var response = await getIt.get<ResetPasswordUseCases>().call(
        ResetPasswordParams(email:emailController.text, newPassword:newPasswordController.text));
    response.fold((failure) =>
        emit(ResetPasswordFailure(errorModel: failure.message)), (user) =>
        emit(ResetPasswordSuccessful(resetPasswordEntity: user)));
  }
}

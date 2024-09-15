import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataResetPassword/remote_reset_password_impl.dart';
import 'package:e_commrece/features/auth/data/repositery/reset_password_repo_impl.dart';
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
    var response = await ResetPasswordUseCases(
        resetPasswordRepo: ResetPasswordRepoImpl(
            remoteResetPassword: RemoteResetPasswordImpl(
                api: DioConsumer(dio: Dio())))).call(
        ResetPasswordParams(email:emailController.text, newPassword:newPasswordController.text));
    response.fold((failure) =>
        emit(ResetPasswordFailure(errorModel: failure)), (user) =>
        emit(ResetPasswordSuccessful(resetPasswordEntity: user)));
  }
}

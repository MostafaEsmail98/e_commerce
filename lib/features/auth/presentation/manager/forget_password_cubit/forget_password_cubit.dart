import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataForgetPassword/remote_forget_password_impl.dart';
import 'package:e_commrece/features/auth/data/repositery/forget_password_repo_impl.dart';
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
    var response = await ForgetPasswordUseCases(
            forgetPasswordRepo: ForgetPasswordRepoImpl(
                remoteForgetPassword:
                    RemoteForgetPasswordImpl(api: DioConsumer(dio: Dio()))))
        .call(params: ForgetPasswordParams(email: emailController.text));
    response.fold(
      (failure) => emit(ForgetPasswordFailure(failure.message)),
      (user) => emit(ForgetPasswordSuccessful(user)),
    );
  }
}

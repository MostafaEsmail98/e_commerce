import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataSignUp/remote_sign_up_impl.dart';
import 'package:e_commrece/features/auth/data/repositery/sign_up_repo_impl.dart';
import 'package:e_commrece/features/auth/domain/usesCase/sign_up_use_cases.dart';
import 'package:flutter/material.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../domain/entities/sign_up_entity.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobilController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  SignUpCubit() : super(SignUpInitial());

  postNewUser() async {
    emit(SignUpLoading());
    var response = await SignUpUseCases(
            signUpRepo: SignUpRepoImpl(
                remoteSignUp: RemoteSignUpImpl(api: DioConsumer(dio: Dio()))))
        .call(
            params: SignUpParams(
                rePassword: rePasswordController.text,
                name: nameController.text,
                mobil: mobilController.text,
                email: emailController.text,
                password: passwordController.text));
    response.fold((failure) => emit(SignUpFailure(failure)),
        (user) => emit(SignUpSuccessful(user)));
  }
}

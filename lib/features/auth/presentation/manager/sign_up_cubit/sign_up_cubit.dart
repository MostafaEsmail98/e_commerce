import 'package:bloc/bloc.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/core/utils/services_locator.dart';
import 'package:e_commrece/features/auth/domain/usesCase/sign_up_use_cases.dart';
import 'package:flutter/material.dart';
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
    var response = await getIt.get<SignUpUseCases>().call(
            params: SignUpParams(
                rePassword: rePasswordController.text,
                name: nameController.text,
                mobil: mobilController.text,
                email: emailController.text,
                password: passwordController.text));
    response.fold((failure) => emit(SignUpFailure(failure.message)),
        (user) => emit(SignUpSuccessful(user)));
  }
}

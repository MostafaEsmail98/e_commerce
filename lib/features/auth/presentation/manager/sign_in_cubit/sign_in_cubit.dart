import 'package:bloc/bloc.dart';
import 'package:e_commrece/core/utils/services_locator.dart';
import 'package:e_commrece/features/auth/domain/usesCase/sign_in_uses_case.dart';
import 'package:e_commrece/features/auth/presentation/manager/sign_in_cubit/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/params/params.dart';


class SignInCubit extends Cubit<SignInState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  SignInCubit() : super(SignInInitial());

  postUser() async {
    emit(SignInLoading());
    var response = await getIt.get<SignInUsesCase>().call(
            params: SignInParams(
                email: emailController.text,
                password: passwordController.text));
    response.fold((failure) => emit(SignInFailure(failure.message)), (user) {
      emit(SignInSuccessful(user));
    });
  }
}

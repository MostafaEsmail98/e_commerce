import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataSignIn/remote_sign_in_impl.dart';
import 'package:e_commrece/features/auth/data/repositery/sign_in_repo_impl.dart';
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
    var response = await SignInUsesCase(
            signInRepo: SignInRepoImpl(
                remoteSignIn: RemoteSignInImpl(api: DioConsumer(dio: Dio())))).call(
            params: SignInParams(
                email: emailController.text,
                password: passwordController.text));
    response.fold((failure) => emit(SignInFailure(failure)), (user) {
      emit(SignInSuccessful(user));
    });
  }
}

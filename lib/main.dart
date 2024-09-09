import 'package:e_commrece/core/utils/routes.dart';
import 'package:e_commrece/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:e_commrece/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commrece/features/auth/presentation/manager/verify_code_cubit/verify_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SignInCubit>(create: (context) => SignInCubit(),),
      BlocProvider<SignUpCubit>(create: (context) => SignUpCubit(),),
      BlocProvider<ForgetPasswordCubit>(create: (context) => ForgetPasswordCubit(),),
      BlocProvider<VerifyCodeCubit>(create: (context) => VerifyCodeCubit(),),
    ], child:  SafeArea(
      child: MaterialApp.router(
        routerConfig: AppRouter.routes,
        debugShowCheckedModeBanner: false,
      ),
    ),);
  }
}

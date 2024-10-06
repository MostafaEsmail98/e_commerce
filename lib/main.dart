import 'package:device_preview/device_preview.dart';
import 'package:e_commrece/core/utils/routes.dart';
import 'package:e_commrece/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:e_commrece/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:e_commrece/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commrece/features/auth/presentation/manager/verify_code_cubit/verify_code_cubit.dart';
import 'package:e_commrece/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';

void main() {
  runApp(DevicePreview(builder: (BuildContext context) =>const MyApp(),
  enabled: !kReleaseMode,
   ));
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SignInCubit>(create: (context) => SignInCubit(),),
      BlocProvider<ResetPasswordCubit>(create: (context) => ResetPasswordCubit(),),
      BlocProvider<SignUpCubit>(create: (context) => SignUpCubit(),),
      BlocProvider<ForgetPasswordCubit>(create: (context) => ForgetPasswordCubit(),),
      BlocProvider<VerifyCodeCubit>(create: (context) => VerifyCodeCubit(),),
      BlocProvider<CategoriesCubit>(create: (context) => CategoriesCubit()..getAllCategories(),),
    ], child:  SafeArea(
      child: MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: AppRouter.routes,
        debugShowCheckedModeBanner: false,
      ),
    ),);
  }
}

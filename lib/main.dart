import 'package:e_commrece/core/utils/routes.dart';
import 'package:e_commrece/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: SafeArea(
        child: MaterialApp.router(
          routerConfig: AppRouter.routes,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

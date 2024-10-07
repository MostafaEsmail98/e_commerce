import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/presentation/screens/forget_password.dart';
import 'package:e_commrece/features/auth/presentation/screens/reset_password.dart';
import 'package:e_commrece/features/auth/presentation/screens/sign_in.dart';
import 'package:e_commrece/features/auth/presentation/screens/sign_up.dart';
import 'package:e_commrece/features/auth/presentation/screens/verify_code.dart';
import 'package:e_commrece/features/home/presentation/manager/all_product_cubit/all_product_cubit.dart';
import 'package:e_commrece/features/home/presentation/manager/specific_product_cubit/specific_product_cubit.dart';
import 'package:e_commrece/features/home/presentation/screens/cart_screen.dart';
import 'package:e_commrece/features/home/presentation/screens/home_screen.dart';
import 'package:e_commrece/features/home/presentation/screens/product_details_screen.dart';
import 'package:e_commrece/features/home/presentation/screens/product_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/splash.dart';

abstract class AppRouter {
  static final routes = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Splash(),
    ),
    GoRoute(
      path: '/SignIn',
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: '/SignUp',
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
      path: '/ForgetPassword',
      builder: (context, state) => const ForgetPassword(),
    ),
    GoRoute(
      path: '/VerifyCode',
      builder: (context, state) => const VerifyCode(),
    ),
    GoRoute(
      path: '/ResetPassword',
      builder: (context, state) => const ResetPassword(),
    ),
    GoRoute(
      path: '/Home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
        path: '/ProductItems',
        builder: (context, state) {
          var res = state.extra as String?;
          return BlocProvider(
            create: (context) =>
                AllProductCubit()..getAllProduct(BrandsParams(id: res)),
            child: const ProductItems(),
          );
        }),
    GoRoute(
      path: '/Cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/ProductDetails',
      builder: (context, state) {
        var res = state.extra as String?;
        return BlocProvider(
          create: (context) => SpecificProductCubit()
            ..getSpecificProduct(ProductParams(id: res)),
          child: const ProductDetailsScreen(),
        );
      },
    ),
  ]);
}

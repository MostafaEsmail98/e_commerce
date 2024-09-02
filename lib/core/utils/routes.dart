import 'package:e_commrece/features/auth/presentation/screens/sign_in.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/splash.dart';

abstract class AppRouter {
  static final routes = GoRouter(
    routes: [
    GoRoute(
    path: '/',
    builder: (context, state) => const Splash(),
  ),    GoRoute(
    path: '/SignIn',
    builder: (context, state) => const SignIn(),
  ),

    ]
  );
}
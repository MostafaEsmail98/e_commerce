import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/routes.dart';
import '../../../generated/assets.dart';


class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3,),() {
      GoRouter.of(context).push(AppRouter.signIn);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff004182),
        ),
        child: Center(
            child: SvgPicture.asset(
          Assets.assetsImagesLogo,
          width: MediaQuery.sizeOf(context).width*.75,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        )),
      ),
    );
  }
}

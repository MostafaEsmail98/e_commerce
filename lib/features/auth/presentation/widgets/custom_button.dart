import 'package:e_commrece/core/utils/app_styles.dart';
import 'package:e_commrece/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../manager/sign_in_cubit/sign_in_state.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
        onPressed: onPressed,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * .06,
          width: double.maxFinite,
          child: BlocConsumer<SignInCubit, SignInState>(
            builder: (context, state) {
              if (state is SignInLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SignInFailure) {
                return Center(
                  child: Text(
                    state.failure.errMassage,
                    style: AppStyles.textSemiBold18(context)
                        .copyWith(color: Colors.red),
                  ),
                );
              } else if (state is SignInSuccessful) {
                return Center(
                    child: Text(
                  "Done",
                  style: AppStyles.textSemiBold18(context),
                ));
              }
              return Center(
                child: Text(
                  "Login",
                  style: AppStyles.textSemiBold18(context),
                ),
              );
            }, listener: (BuildContext context, SignInState state) {
              if (state is SignInSuccessful){
                GoRouter.of(context).push("/Home");
              }
          },
          ),
        ));
  }
}

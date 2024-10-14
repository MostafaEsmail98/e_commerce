import 'package:e_commrece/core/utils/k_colors.dart';
import 'package:e_commrece/core/utils/string.dart';
import 'package:e_commrece/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:e_commrece/features/auth/presentation/widgets/custom_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_space_height.dart';
import '../widgets/custom_text_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Form(
        key: context.read<ResetPasswordCubit>().key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const CustomLogo(),
              const CustomSpaceHeight(height: .02),
              CustomTextField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Email cannot be empty";
                    } else if (!val.emailValid) {
                      return "This should be valid Email.";
                    }
                    return null;
                  },
                  text: "Enter your email",
                  controller:
                      context.read<ResetPasswordCubit>().emailController,
                  title: "E-mail"),
              const CustomSpaceHeight(height: .03),
              CustomTextField(
                text: "Enter your New password",
                controller:
                    context.read<ResetPasswordCubit>().newPasswordController,
                title: "New Password",
                isPassword: true,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Password cannot be empty";
                  } else if (val.length < 8) {
                    return "Password should be more than 7 letters";
                  }
                  return null;
                },
              ),
              const CustomSpaceHeight(height: .05),
              ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                onPressed: () {
                  if (context
                      .read<ResetPasswordCubit>()
                      .key
                      .currentState!
                      .validate()) {
                    context.read<ResetPasswordCubit>().resetPassword();
                    context
                        .read<ResetPasswordCubit>()
                        .newPasswordController
                        .text = "";
                    context.read<ResetPasswordCubit>().emailController.text =
                        "";
                  }
                },
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * .06,
                  width: double.maxFinite,
                  child: Center(child:
                      BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                    builder: (context, state) {
                      if (state is ResetPasswordLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is ResetPasswordSuccessful) {
                        return Text(
                          "Done",
                          style: AppStyles.textSemiBold18(context),
                        );
                      } else if (state is ResetPasswordFailure) {
                        return Text(state.errorModel,
                            style: AppStyles.textSemiBold18(context));
                      }
                      return Text(
                        "Sign In",
                        style: AppStyles.textSemiBold18(context),
                      );
                    },
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_commrece/core/utils/app_styles.dart';
import 'package:e_commrece/core/utils/k_colors.dart';
import 'package:e_commrece/core/utils/routes.dart';
import 'package:e_commrece/core/utils/string.dart';
import 'package:e_commrece/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commrece/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:e_commrece/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/custom_space_height.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_logo.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backGround,
      body: SingleChildScrollView(
        child: Form(
          key:  context.read<SignInCubit>().key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const CustomSpaceHeight(
                  height: .02,
                ),
                const CustomLogo(),
                const CustomSpaceHeight(height: .03),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome Back To ShopEase",
                    style: AppStyles.textSemiBold24(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please sign in with your mail",
                    style: AppStyles.textLight16(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
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
                    text: "Enter your name",
                    controller:context.read<SignInCubit>().emailController,
                    title: "User Name"),
                const CustomSpaceHeight(height: .03),
                CustomTextField(
                  text: "Enter your password",
                  controller: context.read<SignInCubit>().passwordController,
                  title: "Password",
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
                const CustomSpaceHeight(height: .01),
                 Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.forgetPassword);
                        },
                        text: "Forget password")),
                const CustomSpaceHeight(height: .03),
                CustomButton(
                  onPressed: () {
                    if ( context.read<SignInCubit>().key.currentState!.validate()) {
                      context.read<SignInCubit>().postUser();
                    }
                  },
                ),
                const CustomSpaceHeight(height: .02),
                 Center(
                  child: CustomTextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.signUp);
                    },
                    text: "Don’t have an account? Create Account",
                  ),
                ),
                const CustomSpaceHeight(height: .02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

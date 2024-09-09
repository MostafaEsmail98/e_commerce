import 'package:e_commrece/core/utils/app_styles.dart';
import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/core/utils/string.dart';
import 'package:e_commrece/features/auth/presentation/widgets/custom_logo.dart';
import 'package:e_commrece/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/k_colors.dart';
import '../widgets/custom_text_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController mobilController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey <FormState>key = GlobalKey();
    return Scaffold(
      backgroundColor: backGround,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: key,
            child: Column(
              children: [
                const CustomLogo(),
                CustomTextField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Name cannot be empty";
                      }
                      return null;
                    },
                    text: "Enter your full name",
                    controller: nameController,
                    title: "Full Name"),
                const CustomSpaceHeight(height: .03),
                CustomTextField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Mobil cannot be empty";
                      } else if (val.length < 11) {
                        return "Mobil should be more than 11 letters";
                      }
                      return null;
                    },
                    text: "Enter your mobile no.",
                    controller: mobilController,
                    title: "Mobile Number"),
                const CustomSpaceHeight(height: .03),
                CustomTextField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Email cannot be empty";
                      } else if (!val.emailValid) {
                        return "This should be valid Email.";
                      }
                      return null;
                    },
                    text: "Enter your email address",
                    controller: emailController,
                    title: "E-mail Address"),
                const CustomSpaceHeight(height: .03),
                CustomTextField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (val.length < 8) {
                        return "Password should be more than 7 letters";
                      }
                      return null;
                    },
                    isPassword: true,
                    text: "Enter your password",
                    controller: passwordController,
                    title: "Password"),
                const CustomSpaceHeight(height: .05),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    onPressed: () {
                      if (key.currentState!.validate()) {
                      }
                    },
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * .06,
                      width: double.maxFinite,
                      child: Center(
                          child: Text(
                        "Sign Up",
                        style: AppStyles.textSemiBold18(context),
                      )),
                    )),
                Center(
                  child: CustomTextButton(
                    onPressed: () {
                      GoRouter.of(context).push("/SignIn");
                    },
                    text: "Do have an account? Sign In",
                  ),
                ),
                const CustomSpaceHeight(height: .03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

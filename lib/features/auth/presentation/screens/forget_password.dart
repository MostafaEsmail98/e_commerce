import 'package:e_commrece/core/utils/app_styles.dart';
import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/core/utils/k_colors.dart';
import 'package:e_commrece/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:e_commrece/features/auth/presentation/widgets/custom_logo.dart';
import 'package:e_commrece/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.white,
              content: state is ForgetPasswordSuccessful
                  ? Text(
                      state.passwordEntity.message,
                      style: const TextStyle(color: Colors.black),
                    )
                  : state is ForgetPasswordFailure
                      ? Text(state.errorModel.errMassage,
                          style: const TextStyle(color: Colors.black))
                      : const Text("Loading",style:TextStyle(color: Colors.black)),
            ),
          );
        },
        child: Form(
          key: context.read<ForgetPasswordCubit>().key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const CustomLogo(),
                Text(
                  "Forget Password",
                  style: AppStyles.textSemiBold24(context)
                      .copyWith(color: Colors.white),
                ),
                const CustomSpaceHeight(height: .02),
                CustomTextField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (val.length < 8) {
                        return "Password should be more than 7 letters";
                      }
                      return null;
                    },
                    text: "Enter Your Email",
                    controller:
                        context.read<ForgetPasswordCubit>().emailController,
                    title: "E-mail"),
                const CustomSpaceHeight(height: .03),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            const WidgetStatePropertyAll(Color(0xff06004F)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    onPressed: () {
                      if (context
                          .read<ForgetPasswordCubit>()
                          .key
                          .currentState!
                          .validate()) {
                        context
                            .read<ForgetPasswordCubit>()
                            .postForgetPasswordUser();
                      }
                    },
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * .06,
                      width: double.maxFinite,
                      child: Center(child:
                          BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                        builder: (context, state) {
                          if (state is ForgetPasswordLoading){
                            return const CircularProgressIndicator();
                          }
                          return Text(
                            "Send Code",
                            style: AppStyles.textSemiBold18(context)
                                .copyWith(color: Colors.white),
                          );
                        },
                      )),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

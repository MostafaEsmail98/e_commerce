import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/core/utils/k_colors.dart';
import 'package:e_commrece/features/auth/presentation/manager/verify_code_cubit/verify_code_cubit.dart';
import 'package:e_commrece/features/auth/presentation/widgets/custom_logo.dart';
import 'package:e_commrece/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_styles.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: BlocListener<VerifyCodeCubit, VerifyCodeState>(
  listener: (context, state) {
    if  (state is VerifyCodeSuccessful ){
      GoRouter.of(context).push("/ResetPassword");
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: state is VerifyCodeSuccessful
            ? Text(
          state.verifyCodeEntity.status,
          style: const TextStyle(color: Colors.black),
        )
            : state is VerifyCodeFailure
            ? Text(state.errorModel.errMassage,
            style: const TextStyle(color: Colors.black))
            : const Text("Loading",style:TextStyle(color: Colors.black)),
      ),
    );
  },
  child: Form(
        key: context.read<VerifyCodeCubit>().key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const CustomLogo(),
              CustomTextField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Code cannot be empty";
                  }
                  return null;
                },
                  text: "Enter Your Code",
                  controller: context.read<VerifyCodeCubit>().codeController,
                  title: "Code"),
              const CustomSpaceHeight(height: .03),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(Color(0xff06004F)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  onPressed: () {
                    if (context.read<VerifyCodeCubit>().key.currentState!.validate()) {
                      context.read<VerifyCodeCubit>().postVerifyCode();
                      context.read<VerifyCodeCubit>().codeController.text="";
                    }
                  },
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * .06,
                    width: double.maxFinite,
                    child: Center(
                        child: Text(
                      "Send",
                      style: AppStyles.textSemiBold18(context)
                          .copyWith(color: Colors.white),
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

import 'package:e_commrece/core/utils/app_styles.dart';
import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/core/utils/k_colors.dart';
import 'package:e_commrece/features/auth/presentation/widgets/custom_logo.dart';
import 'package:e_commrece/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    GlobalKey <FormState> key = GlobalKey();
    return Scaffold(
      backgroundColor: backGround,
      body: Form(
        key: key,
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
                  controller: emailController,
                  title: "E-mail"),
              const CustomSpaceHeight(height: .03),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(Color(0xff06004F)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  onPressed: () {
                    if (key.currentState!.validate()){

                    }
                  },
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * .06,
                    width: double.maxFinite,
                    child: Center(
                        child: Text(
                      "Send Code",
                      style: AppStyles.textSemiBold18(context)
                          .copyWith(color: Colors.white),
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

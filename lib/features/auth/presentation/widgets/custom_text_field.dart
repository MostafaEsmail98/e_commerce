import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class CustomTextField extends StatefulWidget {
  final String text;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String title;

  const CustomTextField({
    super.key,
    required this.text,
    this.isPassword = false,
    this.validator,
    required this.controller,
    required this.title,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style:
              AppStyles.textMedium18(context).copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          obscureText: _obscureText && widget.isPassword,
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: widget.text,
            hintStyle: AppStyles.textLight18(context),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Color(0xffD9D9D9))),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.red)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Color(0xffD9D9D9))),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Color(0xffD9D9D9))),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      _obscureText = !_obscureText;
                      setState(() {});
                    },
                    icon: Icon(_obscureText
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

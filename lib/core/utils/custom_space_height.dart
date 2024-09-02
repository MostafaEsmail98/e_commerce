import 'package:flutter/material.dart';

class CustomSpaceHeight extends StatelessWidget {
  const CustomSpaceHeight({
    super.key, required this.height,
  });
  final double height ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * height,
    );
  }
}

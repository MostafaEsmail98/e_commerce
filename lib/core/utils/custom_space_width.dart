import 'package:flutter/material.dart';

class CustomSpaceWidth extends StatelessWidget {
  const CustomSpaceWidth({
    super.key, required this.width,
  });
  final double width ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * width,
    );
  }
}

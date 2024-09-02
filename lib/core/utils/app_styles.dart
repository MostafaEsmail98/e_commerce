import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'k_colors.dart';

abstract class AppStyles {
  static TextStyle textRegular12(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w400,
      color: textColor,
    );
  }

  static TextStyle textRegular14(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      color: textColor,
    );
  }

  static TextStyle textRegular11(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontWeight: FontWeight.w400,
      color: textColor,
    );
  }  static TextStyle textRegular18(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w400,
      color: textColor,
    );
  }

  static TextStyle textMedium18(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w500,
      color: textColor,
    );
  }
  static TextStyle textMedium22(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.w500,
      color: textColor,
    );
  }
  static TextStyle textMedium20(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w500,
      color: textColor,
    );
  }

  static TextStyle textMedium14(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w500,
      color: textColor,
    );
  }

  static TextStyle textLight18(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w300,
      color: textColor,
    );
  }   static TextStyle textLight16(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w300,
      color: textColor,
    );
  }  static TextStyle textLight14(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w300,
      color: textColor,
    );
  }  static TextStyle textSemiBold24(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w600,
      color: textColor,
    );
  }static TextStyle textSemiBold16(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600,
      color: textColor,
    );
  }static TextStyle textSemiBold18(context) {
    return GoogleFonts.poppins(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w600,
      color: textColor,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 500;
  } else if (width < 1250) {
    return width / 950;
  } else {
    return width / 1920;
  }
}

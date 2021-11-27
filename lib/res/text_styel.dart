import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TextCommon {
  // static TextStyle kRub40014LG = GoogleFonts.(
  //   textStyle: TextStyle(
  //     fontWeight: FontWeight.w400,
  //   ),
  // );
  static TextStyle commonStyel({Color? color}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 30.sp,
        fontFamily: 'Avenir');
  }

  static TextStyle commonStyleMedium({Color? color}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 19.sp,
        fontFamily: 'Avenir');
  }

  static TextStyle commonStyleSmall({Color? color}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
        fontFamily: 'Avenir');
  }

  static TextStyle commonStyle16({Color? color}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        fontFamily: 'Avenir');
  }
}

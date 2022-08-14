import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryClr = Color(0xFF00838F);
const purpleClr = Color(0xFF4527A0);
const tealClr = Color(0xFF00695C);
const pinkClr = Color(0xFFAD1457);
const darkGreyClr = Color(0xFF121212);

class Themes{
  static final light= ThemeData(
  backgroundColor: Colors.cyan[200],
  primaryColor: primaryClr,
  brightness: Brightness.light
  );

  static final dark= ThemeData(
  backgroundColor: Colors.grey[800],
  primaryColor: primaryClr,
  brightness: Brightness.dark
  );
}

TextStyle get subHeadingStyle{
  return GoogleFonts.lato (
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode?Colors.grey[400]:Colors.grey
    ),
  );
}

TextStyle get headingStyle{
  return GoogleFonts.lato (
    textStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.white:Colors.black
    ),
  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato (
    textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode?Colors.white:Colors.black
    ),
  );
}

TextStyle get subTitleStyle{
  return GoogleFonts.lato (
    textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode?Colors.grey[100]:Colors.grey[600]
    ),
  );
}
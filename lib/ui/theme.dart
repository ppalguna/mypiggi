import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
const bluishClr = Color.fromRGBO(58, 134, 255, 1);
const primaryClr = bluishClr;
const darkHeaderClr = Color(0xFF424242);
const darkGreyClr = Color(0xFF424242);
const greenClr = Color.fromRGBO(251, 111, 146, 1);
const yellowClr = Color.fromRGBO(109, 89, 122, 1);
const bgClr = Color.fromRGBO(158, 161, 153, 10);

class Themes{
static final light= ThemeData(
  backgroundColor: Colors.white,
          primaryColor: primaryClr, //warna addbar dan tombol
          brightness: Brightness.light
      );
static final dark= ThemeData(
  backgroundColor: darkGreyClr,
      primaryColor: darkGreyClr, //warna addbar dan tombol
      brightness: Brightness.dark
  );
}
TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode?Colors.grey[400]:Colors.white
    )
  );
}
TextStyle get headingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold
    )
  );
}
 
TextStyle get titleStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode?Colors.white:Colors.black
      
    )
  );
}
TextStyle get subStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode?Colors.grey[100]: Colors.grey[600]
      
    )
  );
}
TextStyle get subTitleStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode?Colors.grey[100]: Colors.grey[600]
      
    )
  );
}
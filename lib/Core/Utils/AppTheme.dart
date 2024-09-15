import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Core/Utils/AppColors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
      appBarTheme:const AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColors.whiteColor
        )
      ),
      textTheme: TextTheme(
          displayLarge: GoogleFonts.exo(
              fontSize: 22,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.normal),
          bodyLarge: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.grayColor),
      labelMedium: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color:const Color(0xffA3A3A3)
      )));
}

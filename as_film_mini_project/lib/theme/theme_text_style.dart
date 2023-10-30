import 'package:as_film_mini_project/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeTextStyle {
  TextStyle asFilm = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: ThemeColor().white2Color,
  );

  TextStyle welcome = GoogleFonts.poppins(
    fontSize: 35,
    fontWeight: FontWeight.w600,
    color: ThemeColor().blue2Color,
  );

  TextStyle welcomeUsername = GoogleFonts.poppins(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: ThemeColor().blue2Color,
  );
  

  TextStyle login = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ThemeColor().white2Color,
  );

  TextStyle film = GoogleFonts.poppins(
    fontSize: 19,
    fontWeight: FontWeight.w700,
    color: ThemeColor().blue2Color,
  );

  TextStyle titleFilm = GoogleFonts.poppins(
    fontSize: 19,
    fontWeight: FontWeight.w600,
    color: ThemeColor().whiteColor,
  );

  TextStyle overviewFilm = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: ThemeColor().white2Color,
  );

  TextStyle overviewFilm2 = GoogleFonts.poppins(
    fontSize: 21,
    fontWeight: FontWeight.w400,
    color: ThemeColor().white2Color,
  );

  TextStyle releaseRating = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ThemeColor().whiteColor,
  );
}

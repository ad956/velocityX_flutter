import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      //  textTheme: Theme.of(context).textTheme,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black)));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black)));

  static Color firstColor = Color.fromRGBO(24, 25, 26, 2);
  static Color secColor = Color.fromRGBO(246, 143, 160, 2);
  static Color darkWhiteColor = Color.fromRGBO(225, 217, 209, 2);
  static Color creamColor = Color.fromRGBO(255, 253, 208, 2);
  static Color darkColor = Color.fromRGBO(58, 59, 60, 2);
}

// class MoonTheme {
//   static ThemeData moon(BuildContext context) => ThemeData(
//         backgroundColor: Colors.transparent.withOpacity(0.3),
//         image
//       );
//   BoxDecoration box1 = BoxDecoration(
//     image: DecorationImage(
//         image: AssetImage("assets/back.jpg"), fit: BoxFit.cover),
//   );
// }

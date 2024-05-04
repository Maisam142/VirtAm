import 'package:flutter/material.dart';

class ThemeApp {
  static const Color primaryColor = Color(0xfffe504f);
  static const  Color secondColor =  Colors.white54;
  static  const Color secondColorDark =  Colors.white54;
  static const Color white =  Colors.white;
  static const Color black =  Colors.black;
  static const Color orange =  Colors.orangeAccent;
  static const Color selectedColor =  Colors.black38;
  static const Color unselectedColor = Colors.grey;
  static  Color backGroundColor = Colors.white12;
  static  Color backGroundColor2 = Color(0xfffafafa);


  static const TextStyle titleMedium = TextStyle(
    color: black,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  );
  ///-------------------------------------------------
  static const TextStyle darkThemeTitleMedium = TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  );
  //-----------------------------------------------------------------------------------------------
  static const TextStyle headlineSmall = TextStyle(
    color: black,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.normal,
    fontSize: 8.0,
  );
  ///-------------------------------------------------
  static const TextStyle darkHeadlineSmall = TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.normal,
    fontSize: 8.0,
  );

  //-----------------------------------------------------------------------------------------------
  static const TextStyle labelMedium =  TextStyle(
    color: black,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
  );
  ///-------------------------------------------------
  static const TextStyle darkThemLabelMedium =  TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
  );
  //-----------------------------------------------------------------------------------------------
  static const TextStyle displayLarge =  TextStyle(
    color: black,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 44.0,
  );
  ///-------------------------------------------------
  static const TextStyle darkDisplayLarge =  TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 44.0,
  );

  //-----------------------------------------------------------------------------------------------
  static const TextStyle titleSmall = TextStyle(
    color: black,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
  );
  ///-------------------------------------------------
  static const TextStyle darkThemeTitleSmall = TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
  );

  //-----------------------------------------------------------------------------------------------
  static const TextStyle labelLarge= TextStyle(
    color: black,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 27.0,

  );
  ///-------------------------------------------------
  static const TextStyle darkThemeLabelLarge= TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 27.0,

  );

  //-----------------------------------------------------------------------------------------------
  static const TextStyle bodyLarge= TextStyle(
    color: black,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 27.0,

  );
  ///-------------------------------------------------
  static const TextStyle darkThemeBodyLarge= TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 27.0,

  );

  //-----------------------------------------------------------------------------------------------
  static const TextStyle  bodyMedium = TextStyle(
    color: black,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,

  );
  ///-------------------------------------------------

  static const TextStyle darkThemeBodyMedium = TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,

  );

  //-----------------------------------------------------------------------------------------------
  static const TextStyle  bodySmall = TextStyle(
    color: black,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );
  ///-------------------------------------------------

  static const TextStyle darkThemeBodySmall = TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );
  //-----------------------------------------------------------------------------------------------

  static const TextStyle  displaySmall = TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );
  ///-------------------------------------------------
  static const TextStyle  darkThemeDisplaySmall = TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );

  //-----------------------------------------------------------------------------------------------
  static const TextStyle labelSmall = TextStyle(
    fontFamily: 'Almarai',
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
    decoration: TextDecoration.underline,
    color: black,

  );
  ///-------------------------------------------------
  static const TextStyle darkThemeLabelSmall = TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
    decoration: TextDecoration.underline,

  );

  //-----------------------------------------------------------------------------------------------
  static const TextStyle displayMedium = TextStyle(
    color: white,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 22.0,
  );
  ///-------------------------------------------------

  static const TextStyle darkThemeDisplayMedium = TextStyle(
    color: black,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    fontSize: 22.0,
  );

  //-----------------------------------------------------------------------------------------------


















  static final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ), backgroundColor: Color(0xffBE543D),
      padding: EdgeInsets.zero,
    ),
  );
  static const BottomNavigationBarThemeData bottomNavigationBarTheme = BottomNavigationBarThemeData(
  selectedIconTheme: IconThemeData( color: selectedColor, size: 30),
  unselectedIconTheme: IconThemeData(color: unselectedColor, size: 25),
  unselectedItemColor: unselectedColor,
  selectedItemColor: selectedColor,
  backgroundColor: white,
  );
  static  InputDecorationTheme inputDecorationTheme =  InputDecorationTheme(
  contentPadding:  const EdgeInsets.all(10),
  hintStyle: const TextStyle(color: black, fontSize: 15),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
  width: 3,
  color: white,
  style: BorderStyle.solid,
  ),
  ),
  );

  static final ThemeData light = ThemeData.light().copyWith(
    focusColor: black ,
    primaryColor: primaryColor,
    secondaryHeaderColor: white,
    hoverColor: unselectedColor,
    dialogBackgroundColor: black ,

    canvasColor: backGroundColor,
    primaryColorDark: secondColor.withOpacity(0.4),
    textTheme: const TextTheme(
      displaySmall: displaySmall,
      titleSmall: titleSmall,
      titleMedium: titleMedium,
      labelSmall: labelSmall,
      labelMedium: labelMedium,
      labelLarge: labelLarge,
      bodySmall: bodySmall,
      bodyMedium: bodyMedium,
      displayMedium: displayMedium,
      displayLarge: displayLarge,
      headlineSmall: headlineSmall,
      bodyLarge: bodyLarge,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: backGroundColor,
    ),
    scaffoldBackgroundColor: backGroundColor2,
    inputDecorationTheme: inputDecorationTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,

  );

  static final ThemeData dark = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    canvasColor: backGroundColor,
    focusColor: backGroundColor,
    hoverColor: secondColor,
    dialogBackgroundColor: secondColorDark ,
    secondaryHeaderColor: secondColorDark,
    textTheme: const TextTheme(
      titleSmall: darkThemeTitleSmall,
      titleMedium: darkThemeTitleMedium,
      labelSmall: darkThemeLabelSmall,
      displaySmall: darkThemeDisplaySmall,
      labelMedium: darkThemLabelMedium,
      labelLarge: darkThemeLabelLarge,
      bodySmall: darkThemeBodySmall,
      bodyMedium: darkThemeBodyMedium,
      displayMedium: darkThemeDisplayMedium,
      displayLarge: darkDisplayLarge,
      headlineSmall: darkHeadlineSmall,
      bodyLarge: darkThemeBodyLarge
    ),
    elevatedButtonTheme: elevatedButtonTheme,
    scaffoldBackgroundColor: backGroundColor,
    appBarTheme:  AppBarTheme(
      color: secondColor,
      //backgroundColor: secondColor,
    ),
    bottomNavigationBarTheme: bottomNavigationBarTheme.copyWith(
      backgroundColor: secondColorDark.withOpacity(0.4),

    ),

  );


}
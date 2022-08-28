import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightThem = ThemeData(
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    primarySwatch: Colors.blue,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.blue),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        size: 30,
      ),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      elevation: 20.0,
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.black,
        ),
        headline2: TextStyle(
          color: Colors.black,
        ),
        bodyText1: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
        bodyText2: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        caption: TextStyle(
          color: Colors.black,
        )));
ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.blue),
  scaffoldBackgroundColor: const Color.fromRGBO(51, 55, 57, 1),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(51, 55, 57, 1),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(51, 55, 57, 1),
        statusBarIconBrightness: Brightness.light),
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        size: 30,
      ),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white,
      backgroundColor: Color.fromRGBO(51, 55, 57, 1),
      elevation: 20.0),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.white,
      ),
      headline2: TextStyle(
        color: Colors.white,
      ),
      bodyText1: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
      bodyText2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      caption: TextStyle(
        color: Colors.grey,
      )),
);

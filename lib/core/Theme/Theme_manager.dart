import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ThemeManager{
  static const Color greyColor = Color(0xff67686D);
  static const Color primaryColor = Color(0xff1f1d2b);
  static const Color selectIcon = Color(0xff0296e5);
  static const Color selectedCategories = Colors.blue;
  static const Color searchColor = Color(0xff3a3f47);
  static const Color whiteColor = Color(0xffffffff);
  static const Color orangeColor = Color(0xffFF8700);




  static ThemeData nightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: ThemeManager.primaryColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ThemeManager.whiteColor
      )
    ),
    scaffoldBackgroundColor: ThemeManager.primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 28),
      backgroundColor: Color(0xff242A32),
      selectedItemColor: ThemeManager.selectIcon,
      unselectedItemColor: ThemeManager.greyColor,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white
      ),
      titleSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.white
      )
    ),
  );
}




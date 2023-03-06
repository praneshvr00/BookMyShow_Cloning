import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:book_my_show/screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    double screenHeight = window.physicalSize.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookMyShow_Clone',
      theme: ThemeData(
          primaryColor: COLOR_WHITE,
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Roboto"),
      home: HomeScreen(),
    );
  }
}

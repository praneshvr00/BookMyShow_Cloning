import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:book_my_show/screens/LocationScreen.dart';
import 'package:book_my_show/utils/widget_functions.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:book_my_show/screens/HomeScreen.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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

// For Testing Purpose

bool _loading = true;

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  //

  @override
  void initState() {
    super.initState();
  }

  // Function

  //
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

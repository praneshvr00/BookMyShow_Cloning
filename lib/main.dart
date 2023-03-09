import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:book_my_show/screens/LocationScreen.dart';
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
      // home: Testing(),
    );
  }
}

// For Testing Purpose
class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  //
  List _buyOrRent = [];
  int activeCarouselIndex = 0;
  @override
  void initState() {
    readJson();
    super.initState();
  }

  // Function
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/localAPI/dynamic_images.json');
    final data = await json.decode(response);
    setState(() {
      _buyOrRent = data['BuyOrRent'];
    });
    for (int i = 0; i < _buyOrRent.length; i++) {
      print(_buyOrRent[i]['movieName']);
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: _buyOrRent.length > 0
            ? Stack(
                children: [
                  CarouselSlider(
                    items: _buyOrRent.map((e) {
                      return Container(
                        width: size.width,
                        height: size.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(e['url']),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text(e['movieName']),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      initialPage: 0,
                      height: size.height * 0.21,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) =>
                          setState(() => activeCarouselIndex = index),
                    ),
                  ),
                  Positioned.fill(
                    bottom: 10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CarouselIndicator(
                        count: _buyOrRent.length,
                        index: activeCarouselIndex,
                        activeColor: Colors.grey,
                        width: 7,
                        height: 7,
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

//ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:book_my_show/utils/widget_functions.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  List<String> carousel_images = [
    "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1460881680858-30d872d5b530?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
    "https://images.unsplash.com/photo-1514533212735-5df27d970db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=812&q=80"
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height * 0.09,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'It All Starts Here',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              addVerticalSpace(4),
              Text(
                'Oddanchatram',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () => print("Search Clicked"),
              icon: Icon(Icons.search),
              color: COLOR_WHITE,
            ),
            IconButton(
              onPressed: () => print("Notify Clicked"),
              icon: Icon(Icons.notifications_outlined),
              color: COLOR_WHITE,
            ),
            IconButton(
              onPressed: () => print("QR Clicked"),
              icon: Icon(Icons.qr_code),
              color: COLOR_WHITE,
            ),
          ],
          backgroundColor: COLOR_DARK_BLUE,
        ),
        body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.red,
                      height: size.height * 0.11,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            color: Colors.white,
                            width: 74,
                            height: 40,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () => {print("Movies Clicked")},
                                  icon: Icon(Icons.movie),
                                ),
                                Text(
                                  'Movies',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: 74,
                            height: 40,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () => {print("Stream Clicked")},
                                  icon: Icon(Icons.stream_rounded),
                                ),
                                Text(
                                  'Stream',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: 74,
                            height: 40,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () => {print("Sports Clicked")},
                                  icon: Icon(Icons.sports),
                                ),
                                Text(
                                  'Sports',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: 74,
                            height: 40,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () => {print("Comedy Clicked")},
                                  icon: Icon(Icons.theater_comedy),
                                ),
                                Text(
                                  'Comedy Shows',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: 74,
                            height: 40,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () => {print("Music Clicked")},
                                  icon: Icon(Icons.music_video),
                                ),
                                Text(
                                  'Music\nShows',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: 74,
                            height: 40,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      {print("Amusement Park Clicked")},
                                  icon: Icon(Icons.park),
                                ),
                                Text(
                                  'Amusement\nPark',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: 74,
                            height: 40,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () => {print("All Clicked")},
                                  icon: Icon(Icons.menu),
                                ),
                                Text(
                                  'See All',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        CarouselSlider(
                          items: carousel_images.map((e) {
                            return Container(
                              width: size.width,
                              height: size.height,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(e),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlay: true,
                            initialPage: 0,
                            height: size.height * 0.21,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                          ),
                        ),
                        Positioned.fill(
                          bottom: 10,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: CarouselIndicator(
                              count: carousel_images.length,
                              index: activeIndex,
                              activeColor: Colors.grey,
                              width: 7,
                              height: 7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

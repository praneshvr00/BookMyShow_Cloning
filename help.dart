// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:book_my_show/screens/EventsScreen.dart';
import 'package:book_my_show/screens/ProfileScreen.dart';
import 'package:book_my_show/utils/apiFetch.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:book_my_show/utils/widget_functions.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var _future;

class _HomeScreenState extends State<HomeScreen> {
  //
  int activeCarouselIndex = 0;
  int _selectedPageIndex = 0;
  List _bestEvents = [];
  // late final Future<List<dynamic>> _future;
  List<String> carousel_images = [
    "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1460881680858-30d872d5b530?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
    "https://images.unsplash.com/photo-1514533212735-5df27d970db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=812&q=80"
  ];
  void _onBottomNavItemTaped(int index) {
    if (index != 1)
      setState(() {
        _selectedPageIndex = index;
      });
    if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const EventsScreen()));
    }
  }

  @override
  void initState() {
    print("nit called");
    super.initState();
    _future = readJson();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     _future = readJson();
  //   });
  // }

  // setUpTimedFetch() {
  //   Timer.periodic(Duration(seconds: 5), (timer) {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double _margin = 15.0;
    const double _widgetspace = 25.0;
    return SafeArea(
      child: Scaffold(
        appBar: _selectedPageIndex == 2
            ? AppBar(
                toolbarHeight: size.height * 0.09,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                    addVerticalSpace(4),
                    Text(
                      'Edit Profile',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () => print("Profile Account Clicked"),
                    icon: Icon(Icons.person),
                    color: COLOR_WHITE,
                  ),
                ],
                backgroundColor: COLOR_DARK_BLUE,
              )
            : AppBar(
                toolbarHeight: size.height * 0.09,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'It All Starts Here',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                    addVerticalSpace(4),
                    Text(
                      'Oddanchatram',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
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
        body: _selectedPageIndex == 2
            ? ProfileScreen()
            : Container(
                width: size.width,
                height: size.height,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                        onPressed: () => {print(readJson)},
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
                                        onPressed: () =>
                                            {print("Stream Clicked")},
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
                                        onPressed: () =>
                                            {print("Sports Clicked")},
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
                                        onPressed: () =>
                                            {print("Comedy Clicked")},
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
                                        onPressed: () =>
                                            {print("Music Clicked")},
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
                                  onPageChanged: (index, reason) => setState(
                                      () => activeCarouselIndex = index),
                                ),
                              ),
                              Positioned.fill(
                                bottom: 10,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: CarouselIndicator(
                                    count: carousel_images.length,
                                    index: activeCarouselIndex,
                                    activeColor: Colors.grey,
                                    width: 7,
                                    height: 7,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          addVerticalSpace(_widgetspace),
                          Padding(
                            padding:
                                EdgeInsets.only(left: _margin, right: _margin),
                            child: GestureDetector(
                              child: Container(
                                child: Image.asset(
                                  'assets/images/2free movies tickets.png',
                                  width: size.width,
                                  fit: BoxFit.cover,
                                  height: size.height * 0.12,
                                ),
                              ),
                            ),
                          ),
                          addVerticalSpace(_widgetspace),
                          Padding(
                            padding:
                                EdgeInsets.only(left: _margin, right: _margin),
                            child: GestureDetector(
                              child: Container(
                                width: size.width,
                                height: size.height * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/browse my cinemas.png'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          addVerticalSpace(_widgetspace),
                          Padding(
                            padding:
                                EdgeInsets.only(left: _margin, right: _margin),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/spotify premium.jpg'),
                                ),
                              ),
                              width: size.width,
                              height: size.height * 0.28,
                            ),
                          ),
                          // style: TextStyle(
                          //                   fontSize: 13,
                          //                   fontWeight: FontWeight.w100),
                          //               textAlign: TextAlign.center,
                          addVerticalSpace(8.0),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: _margin, right: _margin),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "The Best Events This Week",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  addVerticalSpace(4.0),
                                  Text(
                                    "Monday to Sunday, we got covered",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              )),
                          addVerticalSpace(12.0),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: _margin, right: _margin),
                            child: imageBuilder(),
                          ),
                          addVerticalSpace(12.0),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       left: _margin, right: _margin),
                          //   child: imageBuilder(context, size),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: 'Events'),
            BottomNavigationBarItem(icon: Icon(Icons.man), label: 'Profile'),
          ],
          currentIndex: _selectedPageIndex,
          selectedItemColor: COLOR_PINKISH_RED,
          onTap: _onBottomNavItemTaped,
        ),
      ),
    );
  }

  Widget imageBuilder() {
    return FutureBuilder<List>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          print("1");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List axeList = snapshot.data!;

            return Container(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: axeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                axeList[index]['url'],
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                      width: 100,
                      height: 100,
                    );
                  }),
            );
          }
          return const Text("No Data");
        });
  }
}

Future<List> readJson() async {
  final String response =
      await rootBundle.loadString('assets/localAPI/dynamic_images.json');
  final data = await json.decode(response);
  // print(data);
  return data[0]['BestEvents'];
}
// Container(
//               child: Image.network(
//                 axeList[0]['url'],
//                 width: 100,
//                 height: 150,
//               ),
//             );
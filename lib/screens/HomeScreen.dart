// ignore_for_file: prefer_const_constructors
//

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:book_my_show/globals.dart' as globals;
import 'package:book_my_show/screens/EventsScreen.dart';
import 'package:book_my_show/screens/ProfileScreen.dart';
import 'package:book_my_show/utils/widget_functions.dart';
import 'package:book_my_show/screens/LocationScreen.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool _loading = true; // initial loading value

class _HomeScreenState extends State<HomeScreen> {
  //
  int activeCarouselIndex = 0; // for first carousel
  int _activeBuyOrRentIndex = 0; // for buy or rent carousel
  int _selectedPageIndex = 0; // for bottom navbar
  // for .json backend data
  List _fetchedBestEventData = [];
  List _fetchedUltiEventData = [];
  List _fetchedBuyOrRentData = [];
  List _fetchedBestOfLiveData = [];
  List _fetchedLiveEventsData = [];
  List _fetchedLaughterTherapyData = [];
  List _fetchedPopularEventsData = [];
  List _fetchedTopGamesEventsData = [];
  List _fetchedFunActivitiesData = [];
  List _fetchedBuzzData = [];
  // for top navbar items
  List<dynamic> _itemNavbar = [
    ["Movies", Icons.movie],
    ["Stream", Icons.stream_rounded],
    ["Sports", Icons.sports],
    ["Comedy Shows", Icons.theater_comedy],
    ["Music Shows", Icons.music_video],
    ["Amusement Park", Icons.park],
    ["See All", Icons.menu],
  ];
  // for first carousel images
  List<String> carousel_images = [
    "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1460881680858-30d872d5b530?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
    "https://images.unsplash.com/photo-1514533212735-5df27d970db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=812&q=80"
  ];

  // for change of bottom navbar
  void _onBottomNavItemTaped(int index) {
    if (index != 1) {
      setState(() {
        _selectedPageIndex = index;
      });
    }
    if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const EventsScreen()));
    }
  }

  // base method
  @override
  void initState() {
    readJson(); // loading data from .json
    super.initState();
  }

  // loading backend .json file
  Future<void> readJson() async {
    //
    final String response =
        await rootBundle.loadString('assets/localAPI/dynamic_images.json');
    final data = await json.decode(response);

    setState(() {
      _fetchedBestEventData = data['BestEvents'];
      _fetchedUltiEventData = data['UltimateEvents'];
      _fetchedBuyOrRentData = data['BuyOrRent'];
      _fetchedBestOfLiveData = data['BestOfLiveEvents'];
      _fetchedLiveEventsData = data['LiveEvents'];
      _fetchedLaughterTherapyData = data['LaughterTherapy'];
      _fetchedPopularEventsData = data['PopularEvents'];
      _fetchedTopGamesEventsData = data['TopGamesEvents'];
      _fetchedFunActivitiesData = data['FunActivities'];
      _fetchedBuzzData = data['Buzz'];
    });

    // delaying 2 seconds after data fetched from .json.
    Timer(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double _margin = 15.0;
    const double _widgetspace = 25.0;
    //
    return _loading
        ? buildLoader(
            size,
            COLOR_PINKISH_RED,
          )
        : SafeArea(
            child: Scaffold(
              appBar: _selectedPageIndex == 2
                  ? AppBar(
                      toolbarHeight: size.height * 0.09,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          addVerticalSpace(
                            4,
                          ),
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      actions: [
                        IconButton(
                          onPressed: () => print(
                            "Profile Account Clicked",
                          ),
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
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          addVerticalSpace(
                            4.0,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LocationScreen(),
                              ),
                            ),
                            child: Text(
                              globals.userLocation,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        IconButton(
                          onPressed: () => print(
                            "Search Clicked",
                          ),
                          icon: Icon(Icons.search),
                          color: COLOR_WHITE,
                        ),
                        IconButton(
                          onPressed: () => print(
                            "Notify Clicked",
                          ),
                          icon: Icon(Icons.notifications_outlined),
                          color: COLOR_WHITE,
                        ),
                        IconButton(
                          onPressed: () => print(
                            "QR Clicked",
                          ),
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
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return itemNavBar(_itemNavbar, index);
                                    },
                                    itemCount: _itemNavbar.length,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    CarouselSlider(
                                      items: carousel_images.map(
                                        (e) {
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
                                        },
                                      ).toList(),
                                      options: CarouselOptions(
                                        viewportFraction: 1,
                                        autoPlay: true,
                                        initialPage: 0,
                                        height: size.height * 0.21,
                                        scrollDirection: Axis.horizontal,
                                        onPageChanged: (index, reason) =>
                                            setState(() =>
                                                activeCarouselIndex = index),
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
                                addVerticalSpace(
                                  _widgetspace,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: _margin, right: _margin),
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
                                addVerticalSpace(
                                  _widgetspace,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: _margin, right: _margin),
                                  child: GestureDetector(
                                    child: Container(
                                      width: size.width,
                                      height: size.height * 0.12,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/browse my cinemas.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                addVerticalSpace(_widgetspace),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: _margin,
                                    right: _margin,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/spotify premium.jpg',
                                        ),
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
                                addVerticalSpace(
                                  8.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: _margin,
                                    right: _margin,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "The Best Events This Week",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      addVerticalSpace(4.0),
                                      Text(
                                        "Monday to Sunday, we got covered",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                addVerticalSpace(
                                  12.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: _margin,
                                    right: _margin,
                                  ),
                                  child: imageBuilder(
                                    "BestEvents",
                                    0.0,
                                    _fetchedBestEventData,
                                    size,
                                    200.0,
                                    3 / 2,
                                    20.0,
                                    10.0,
                                    Axis.vertical,
                                    NeverScrollableScrollPhysics(),
                                  ),
                                ),
                                addVerticalSpace(
                                  _widgetspace,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                      left: _margin,
                                      right: _margin,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "The Ultimate Events List",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        addVerticalSpace(4.0),
                                        Text(
                                          "Good times outdoor or at home",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    )),
                                addVerticalSpace(
                                  12.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: _margin,
                                    right: _margin,
                                  ),
                                  child: imageBuilder(
                                    "UltimateEvents",
                                    size.width * 0.20,
                                    _fetchedUltiEventData,
                                    size,
                                    200.0,
                                    3 / 2,
                                    20.0,
                                    10.0,
                                    Axis.vertical,
                                    NeverScrollableScrollPhysics(),
                                  ),
                                ),
                                addVerticalSpace(
                                  _widgetspace + 12,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/spotify premium.jpg',
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                  width: size.width,
                                  height: size.height * 0.17,
                                ),

                                // carousel card
                                _fetchedBuyOrRentData.length > 0
                                    ? Stack(
                                        children: [
                                          CarouselSlider(
                                            items:
                                                _fetchedBuyOrRentData.map((e) {
                                              return CarouselCard(
                                                e,
                                                size,
                                                _margin,
                                              );
                                            }).toList(),
                                            options: CarouselOptions(
                                              viewportFraction: 1.0,
                                              autoPlay: true,
                                              initialPage: 0,
                                              height: size.height * 0.46,
                                              scrollDirection: Axis.horizontal,
                                              enableInfiniteScroll: false,
                                              onPageChanged: (index, reason) =>
                                                  setState(
                                                () => _activeBuyOrRentIndex =
                                                    index,
                                              ),
                                            ),
                                          ),
                                          Positioned.fill(
                                            bottom: 10,
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: AnimatedSmoothIndicator(
                                                count: _fetchedBuyOrRentData
                                                    .length,
                                                activeIndex:
                                                    _activeBuyOrRentIndex,
                                                effect: ScrollingDotsEffect(
                                                  fixedCenter: true,
                                                  activeDotColor: Colors.white,
                                                  dotHeight: 7,
                                                  dotWidth: 7,
                                                  dotColor: Colors.grey,
                                                  spacing: 4,
                                                  maxVisibleDots:
                                                      _fetchedBuyOrRentData
                                                                  .length >=
                                                              5
                                                          ? 5
                                                          : _fetchedBuyOrRentData
                                                              .length,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                addVerticalSpace(
                                  _widgetspace,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: _margin,
                                    right: _margin,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "The Best of Live Events",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      addVerticalSpace(4.0),
                                      Text(
                                        "Step out or stay in, interesting experiences for everyone",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                addVerticalSpace(
                                  _widgetspace,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: _margin),
                                  child: SizedBox(
                                    width: size.width,
                                    height: 300,
                                    child: imageBuilder(
                                      "BestOfLiveEvents",
                                      0.0,
                                      _fetchedBestOfLiveData,
                                      size,
                                      200.0,
                                      6 / 5,
                                      10.0,
                                      15.0,
                                      Axis.horizontal,
                                      BouncingScrollPhysics(),
                                    ),
                                  ), // 250, 1/2, 20
                                ),
                                addVerticalSpace(
                                  _widgetspace,
                                ),
                                Container(
                                  color: Colors.indigo.shade50,
                                  padding: EdgeInsets.only(left: _margin),
                                  child: Column(
                                    children: [
                                      addVerticalSpace(
                                        12.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                            "Live Events",
                                          ),
                                          _fetchedLiveEventsData.length > 10
                                              ? GestureDetector(
                                                  onTap: () =>
                                                      print("see all clicked"),
                                                  child: RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      children: const [
                                                        TextSpan(
                                                          text: "See All",
                                                          style: TextStyle(
                                                            color:
                                                                COLOR_PINKISH_RED,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        WidgetSpan(
                                                          alignment:
                                                              PlaceholderAlignment
                                                                  .middle,
                                                          child: Icon(
                                                            Icons.arrow_right,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                      addVerticalSpace(
                                        12.0,
                                      ),
                                      EventBuilder(
                                        _fetchedLiveEventsData,
                                        size.height * 0.38,
                                      ),
                                    ],
                                  ),
                                ),
                                addVerticalSpace(
                                  _widgetspace,
                                ),
                                Container(
                                  color: Colors.indigo.shade50,
                                  padding: EdgeInsets.only(left: _margin),
                                  child: Column(
                                    children: [
                                      addVerticalSpace(
                                        12.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                            "Laughter Therapy",
                                          ),
                                          _fetchedLaughterTherapyData.length >
                                                  10
                                              ? GestureDetector(
                                                  onTap: () =>
                                                      print("see all clicked"),
                                                  child: RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                        children: const [
                                                          TextSpan(
                                                            text: "See All",
                                                            style: TextStyle(
                                                              color:
                                                                  COLOR_PINKISH_RED,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                          WidgetSpan(
                                                            alignment:
                                                                PlaceholderAlignment
                                                                    .middle,
                                                            child: Icon(
                                                              Icons.arrow_right,
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                      addVerticalSpace(
                                        12.0,
                                      ),
                                      EventBuilder(
                                        _fetchedLaughterTherapyData,
                                        size.height * 0.38,
                                      ),
                                    ],
                                  ),
                                ),
                                addVerticalSpace(
                                  _widgetspace,
                                ),
                                Container(
                                  color: Colors.indigo.shade50,
                                  padding: EdgeInsets.only(left: _margin),
                                  child: Column(
                                    children: [
                                      addVerticalSpace(
                                        12.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                            "Popular Events",
                                          ),
                                          _fetchedPopularEventsData.length > 10
                                              ? GestureDetector(
                                                  onTap: () =>
                                                      print("see all clicked"),
                                                  child: RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      children: const [
                                                        TextSpan(
                                                          text: "See All",
                                                          style: TextStyle(
                                                            color:
                                                                COLOR_PINKISH_RED,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        WidgetSpan(
                                                          alignment:
                                                              PlaceholderAlignment
                                                                  .middle,
                                                          child: Icon(
                                                            Icons.arrow_right,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                      addVerticalSpace(
                                        12.0,
                                      ),
                                      EventBuilder(
                                        _fetchedPopularEventsData,
                                        size.height * 0.38,
                                      ),
                                    ],
                                  ),
                                ),
                                addVerticalSpace(
                                  _widgetspace,
                                ),
                                Container(
                                  color: Colors.indigo.shade50,
                                  padding: EdgeInsets.only(left: _margin),
                                  child: Column(
                                    children: [
                                      addVerticalSpace(
                                        12.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                            "Top Games & Sport Events",
                                          ),
                                          _fetchedTopGamesEventsData.length > 10
                                              ? GestureDetector(
                                                  onTap: () =>
                                                      print("see all clicked"),
                                                  child: RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      children: const [
                                                        TextSpan(
                                                          text: "See All",
                                                          style: TextStyle(
                                                            color:
                                                                COLOR_PINKISH_RED,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        WidgetSpan(
                                                          alignment:
                                                              PlaceholderAlignment
                                                                  .middle,
                                                          child: Icon(
                                                            Icons.arrow_right,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                      addVerticalSpace(
                                        12.0,
                                      ),
                                      EventBuilder(
                                        _fetchedTopGamesEventsData,
                                        size.height * 0.38,
                                      ),
                                    ],
                                  ),
                                ),
                                addVerticalSpace(
                                  _widgetspace,
                                ),
                                Container(
                                  color: Colors.indigo.shade50,
                                  padding: EdgeInsets.only(left: _margin),
                                  child: Column(
                                    children: [
                                      addVerticalSpace(
                                        12.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                            "Explore Fun Activities",
                                          ),
                                          _fetchedFunActivitiesData.length > 10
                                              ? GestureDetector(
                                                  onTap: () =>
                                                      print("see all clicked"),
                                                  child: RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      children: const [
                                                        TextSpan(
                                                          text: "See All",
                                                          style: TextStyle(
                                                            color:
                                                                COLOR_PINKISH_RED,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        WidgetSpan(
                                                          alignment:
                                                              PlaceholderAlignment
                                                                  .middle,
                                                          child: Icon(
                                                            Icons.arrow_right,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                      addVerticalSpace(12.0),
                                      EventBuilder(
                                        _fetchedFunActivitiesData,
                                        size.height * 0.38,
                                      ),
                                    ],
                                  ),
                                ),
                                addVerticalSpace(
                                  _widgetspace,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: _margin,
                                    right: _margin,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Buzz",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      addVerticalSpace(
                                        4.0,
                                      ),
                                      Text(
                                        "Discover the latest in Entertainment",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                addVerticalSpace(
                                  8.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: _margin),
                                  child: addBuzz(_fetchedBuzzData, size),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.live_tv), label: 'Events'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.man), label: 'Profile'),
                ],
                currentIndex: _selectedPageIndex,
                selectedItemColor: COLOR_PINKISH_RED,
                onTap: _onBottomNavItemTaped,
              ),
            ),
          );
  }
}

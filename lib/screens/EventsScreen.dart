// ignore_for_file: prefer_const_constructors

import 'package:book_my_show/utils/constants.dart';
import 'package:book_my_show/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    //
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => Navigator.pop(context)),
          toolbarHeight: size.height * 0.07,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Experience begins here',
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
          ],
          backgroundColor: COLOR_DARK_BLUE,
        ),
        body: Container(
          child: Text("Events"),
        ),
      ),
    );
  }
}

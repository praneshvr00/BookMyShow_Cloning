// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:book_my_show/utils/constants.dart';
import 'package:book_my_show/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:path_provider/path_provider.dart';
import 'package:book_my_show/globals.dart' as globals;

List<String> location = [];

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  //Variables
  late final File file;
  String _currentLocation = "Pick a Region";
  late double lat;
  late double lon;

  //Functions
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services not enabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.denied) {
        return await Geolocator.getCurrentPosition();
      }
      return Future.error('Location permission is denied');
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Locatrion permissions are permanently denied, cannot request permission');
    }

    return await Geolocator.getCurrentPosition();
  }

  //ReadFile
  // Future<void> readFile(File file) async {
  //   String contents = await file.readAsString();
  //   var jsonResponse = jsonDecode(contents);
  //   print("am here");
  //   print(jsonResponse);
  // }

  // Future<String> getLocalPath() async {
  //   var dir = await getExternalStorageDirectory();
  //   print(dir!.path);
  //   return dir.path;
  // }

  // Future<File> getLocaFile() async {
  //   String path = await getLocalPath();
  //   print(path + '/' + 'locations.json');
  //   return File('$path/locations.json');
  // }

  // Future<File> writeFile(String x) async {
  //   File file = await getLocaFile();
  //   final doesExist = await file.exists();

  //   if (!doesExist) {
  //     file = await file.create();
  //     print("file created");
  //   } else {
  //     print("File exists");
  //   }
  //   return file.writeAsString(x);
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double _margin = 15.0;
    const double _widgetspace = 25.0;

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
                _currentLocation,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          backgroundColor: COLOR_DARK_BLUE,
        ),
        body: Container(
          width: size.width,
          height: size.height * 0.06,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero)),
            ),
            onPressed: () => {
              _getCurrentLocation().then((value) async {
                lat = value.latitude;
                lon = value.longitude;
                List<Placemark> placemarks =
                    await placemarkFromCoordinates(lat, lon);
                setState(() {
                  _currentLocation = placemarks[0].locality!;
                  globals.userLocation = placemarks[0].locality!;
                  Navigator.pop(context);
                });
              })
            },
            icon: Icon(Icons.track_changes, color: COLOR_PINKISH_RED),
            label: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: _margin),
                  child: Text('Auto Detect My Location',
                      style: TextStyle(color: COLOR_PINKISH_RED),
                      textAlign: TextAlign.start),
                )),
          ),
        ),
      ),
    );
  }
}

// 37.4217872
// -122.0844038


// Future<File> _getFile() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File("${directory.path}/data.json");

//     final doesExist = await file.exists();

//     if(!doseExist)
//        file = await file.create(); 

//     return file;
// }

// /storage/emulated/0/Android/data/com.example.book_my_show/files
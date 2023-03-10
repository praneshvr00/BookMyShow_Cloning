// loading file and checking existence

// Future<String> getLocalPath() async {
//     var dir = await getExternalStorageDirectory();
//     File file = File(dir!.path + '/locations.json');
//     final doesExist = await file.exists();

//     if (doesExist) {
//     final String response =
//         await rootBundle.loadString('assets/localAPI/dynamic_images.json');
//       setState(() {
//         globals.userLocation = ;
//       });
//     }
//     return dir.path;
//   }

import 'package:flutter/material.dart';

List<dynamic> _itemNavbar = [
  ["Movies", Icons.movie],
  ["Stream", Icons.stream_rounded],
  ["Sports", Icons.sports],
  ["Comedy Shows", Icons.theater_comedy],
  ["Music Shows", Icons.music_video],
  ["Amusement Park", Icons.park],
  ["See All", Icons.menu],
];

Widget itemNavBar() {
  return Container(
    color: Colors.white,
    width: 74,
    height: 40,
    child: Column(
      children: [
        IconButton(
          onPressed: () => {print("mov")},
          icon: Icon(Icons.movie),
        ),
        Text(
          'Movies',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w100,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

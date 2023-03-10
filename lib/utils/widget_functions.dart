import 'package:flutter/material.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget buildLoader(Size size, Color color) {
  return SafeArea(
    child: Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/book my show.png',
              width: size.width,
              fit: BoxFit.cover,
              height: size.height * 0.12,
            ),
            addVerticalSpace(
              8.0,
            ),
            const Text(
              style: TextStyle(color: Colors.white, fontSize: 18),
              'It All Starts Here',
            ),
            addVerticalSpace(
              size.height * 0.10,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    ),
  );
}

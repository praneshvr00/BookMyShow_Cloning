import 'dart:convert';
import 'package:flutter/services.dart';

//
Future<void> readJson() async {
  final String response =
      await rootBundle.loadString('assets/localAPI/dynamic_images.json');
  final data = await json.decode(response);
  print(data.runtimeType);
  return data;
}

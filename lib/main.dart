import 'package:flutter/material.dart';
import 'package:my_veggielist_app/screen/home.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_veggielist_app/screen/tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: MyHomePage(),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => TabPage())],
    );
  }
}

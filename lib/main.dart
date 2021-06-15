import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_veggielist_app/binding/init_binding.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_veggielist_app/screen/tab.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: MyHomePage(),
      initialBinding: InitBinding(),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => TabPage())],
    );
  }
}

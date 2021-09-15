import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Quiz With GetX",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.orange,
          scaffoldBackgroundColor: Colors.grey.shade900,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey.shade900,
          )),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

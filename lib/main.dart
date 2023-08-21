import 'package:flutter/material.dart';
import 'package:fortune/home.dart';
import 'package:get/get.dart';

import 'LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fortune',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Home( ),
    );
  }
}


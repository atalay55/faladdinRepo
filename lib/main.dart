
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortune/home.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
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


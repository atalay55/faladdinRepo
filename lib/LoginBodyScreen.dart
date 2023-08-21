import 'package:flutter/material.dart';

class LoginBodyScreen extends StatefulWidget
{
  const LoginBodyScreen({Key? key}) : super(key: key);

  @override
  State<LoginBodyScreen> createState() => _LoginBodyScreenState();
}

class _LoginBodyScreenState extends State<LoginBodyScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Form(child: Column(children: [
          Text("name"),
          Text("pass"),
          ElevatedButton(onPressed: null, child: Text("Sign in")),

        ],)),
      ),
    );
  }
}

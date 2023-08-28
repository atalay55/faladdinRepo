import 'package:flutter/material.dart';

import 'LoginBodyScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return    SafeArea(
      child: Scaffold(
        body: Center(
          child: LoginBodyScreen(),
        ),
      ),
    );
  }
  }


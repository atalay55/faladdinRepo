import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InboxEmptyTheme extends StatefulWidget {
  final String title;
  final String description;
  final String? buttonTitle;
  final IconData icon;
  InboxEmptyTheme({required this.title,required this.description, required this.icon, this.buttonTitle});

  @override
  State<InboxEmptyTheme> createState() => _InboxEmptyThemeState();
}

class _InboxEmptyThemeState extends State<InboxEmptyTheme> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundColor: Colors.white24,radius: 50,child: FaIcon(widget.icon,size: 50,color: Colors.grey,)),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(widget.title,style: TextStyle(color: Colors.white,fontSize: Get.width/15),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.description,textAlign: TextAlign.center,style:TextStyle(color: Colors.white)),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:     widget.buttonTitle != null? SizedBox(
                width: Get.width/2,
                child: ElevatedButton(onPressed: null, child: Text(widget.buttonTitle?? " ",style: TextStyle(color: Colors.black),),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),)),
              ):null
            ),

          ],
        ),
      ),
    );
  }
}

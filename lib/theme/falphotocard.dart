import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FalPhotoCard extends StatelessWidget {

  IconData icon;
  String title;
  FalPhotoCard({required this.icon, required this.title});




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black45),
      width: Get.width / 3,
      height: Get.width / 2.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundColor: Colors.purpleAccent,
                radius: 30,
                child: FaIcon(icon, size: 30, color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}

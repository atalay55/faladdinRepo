
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortune/theme/falgridView.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {

   HomePage({Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("Falladdin",style: GoogleFonts.yellowtail(color: Colors.yellow, fontSize:28 ),)),
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Icon(FontAwesomeIcons.bitcoin,color: Colors.yellow,size: 30,),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(FontAwesomeIcons.userCircle ,size: 30,),
          )
        ],
      ),
      body: Container(
        height: Get.height,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0 ,top: 10,bottom: 10),
                child: Text(
                  "iyi günler",
                  style: TextStyle(color: Colors.white, fontSize: Get.width / 18),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "images/astrolojiresmi.png",
                    fit: BoxFit.fitWidth,
                    width: Get.width,
                    height: Get.height / 8,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FalGrid(),
              )
            ],
          ),
        ),
      )
    );

  }
}


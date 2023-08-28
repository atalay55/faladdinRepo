import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fortune/home.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoSend extends StatelessWidget {
  final File imageFile;
  PhotoSend({required this.imageFile });
  late String reportId =" ";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text("Falladdin",style: GoogleFonts.yellowtail(color: Colors.yellow, fontSize:28 ),),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: Image.file(
                imageFile,
                width: 1800,
                height: 1800,
                fit: BoxFit.fill,

              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                //padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.only(
                    left: 20,
                    bottom: 15,
                    right: 20
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: Get.height/17,
                      width: Get.width/3,
                      child: ElevatedButton(
                        onPressed: () {
                        Get.to(Home());
                        },
                        child: Text('Geri Dön'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.black87,// Set the desired color
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: Get.height/17,
                      width: Get.width/3,
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        child: Text('Gönder'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.black87, // Set the desired color
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({Key? key}) : super(key: key);

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  var width =Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/socialbackgr.png'),
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: width/4,left: width/5,right: width/5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Faladdin",style: GoogleFonts.yellowtail(fontSize: width/15,color: Colors.yellow,)),
                  Text("Social",style: GoogleFonts.lobster(fontSize: width/6,color:Colors.purpleAccent),),
                ],
              ),
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Tanıdıklarını kesfet,Yeni arkadaşlar edin",style: TextStyle(fontSize:width/15 ,color: Colors.white,),textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Tanıdıklarınla uyumunu görebilir, mesajlaşabilir hatta falında çıkan kısmetinle karşılaşabilirsin",style: TextStyle(fontSize:width/20 ,color: Colors.white,),textAlign: TextAlign.center,),
                ),

              ],
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width,
                child: ElevatedButton(onPressed: null, child: Text("Hemen Katıl",style: TextStyle(color: Colors.black),)
                  ,style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

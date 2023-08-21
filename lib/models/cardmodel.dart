import 'package:flutter/material.dart';
import 'package:fortune/models/subjectmodel.dart';
import 'package:get/get.dart';

class CardModel extends StatelessWidget {
    Subject subject;
   CardModel({Key? key,required this.subject}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child:Stack(

        alignment: Alignment.bottomLeft, // Üst üste binen öğelerin hizalanma yeri
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("${subject.imagePath}",fit: BoxFit.fill,height: Get.height,width: Get.width,)),
          Padding(
            padding:  EdgeInsets.only(left: 8.0),
            child: Text("${subject.title}",style: TextStyle(fontSize: 22,color: Colors.white),),
          ),
        ],

      ) ,
    );
  }
}

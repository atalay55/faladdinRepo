import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortune/pages/Home/lambacini.dart';
import 'package:fortune/pages/Home/tarotfali.dart';
import 'package:fortune/pages/camera/camerascreen.dart';
import 'package:fortune/models/cardmodel.dart';
import 'package:fortune/pages/camera/photosend.dart';
import 'package:fortune/theme/falphotocard.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../models/subjectmodel.dart';
import '../pages/Home/homepage.dart';

class FalGrid extends StatefulWidget {
  const FalGrid({Key? key}) : super(key: key);

  @override
  State<FalGrid> createState() => _FalGridState();
}

class _FalGridState extends State<FalGrid> {

  String title ="Fincan fotoğraflarını nasıl yüklemek istersiniz?";
  Future<File> _pickImageFromGallery() async {


    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
      }
    });
    return imageFile;
  }

  late File imageFile;
  List<Subject> subjects = <Subject>[
    new Subject(title: "Kahve Falı", imagePath: "images/kahveresmi.png"),
    new Subject(title: "El Falı", imagePath: "images/elfalı.png"),
    new Subject(title: "Tarot Falı", imagePath: "images/tarotfalı.png"),
    new Subject(title: "Lamba Cini", imagePath: "images/lambacini.png"),
    new Subject(title: "Biyoritim ", imagePath: "images/biyoritim.png"),
    new Subject(title: "Günlük Aşk Uyumu", imagePath: "images/günlükask.png"),
    new Subject(
        title: "Günlük Motivasyon ", imagePath: "images/günlükmotivation.png"),
    new Subject(title: "Ay Takvimi ", imagePath: "images/aytakvimi.png"),
  ];
  List<Widget> pages = <Widget>[HomePage(),HomePage(), TarotFali() , const LambaCini() ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          childAspectRatio: 1.4,
          mainAxisSpacing: 5),
      itemCount: 8,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              setState(() {
                print(index);
                index ==1 ? title = "El fotoğraflarınızı nasıl yüklemek istersiniz?":title ="Fincan fotoğraflarınızı nasıl yüklemek istersiniz?";
                index > 1  ?   Get.to(pages[index]): _showModalBottomSheet(context,title);
              });

            },
            child: CardModel(subject: subjects[index]));
      },
    );
  }

void _showModalBottomSheet(BuildContext context,String title) {
  showModalBottomSheet(
    backgroundColor: HexColor("#555555"),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        )),
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 320,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: GoogleFonts.oswald(
                      fontSize: Get.width / 20, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8, top: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        child:
                        FalPhotoCard(
                            icon: FontAwesomeIcons.image, title: "Galeriyi Aç"),
                        onTap: () {
                          setState(() {
                            _pickImageFromGallery().then((value) => Get.to(PhotoSend(imageFile: value)));
                          });

                        }
                    ),
                    GestureDetector(
                      child:
                      FalPhotoCard(
                          icon: FontAwesomeIcons.camera, title: "Fotoğraf çek"),
                      onTap: () {
                        setState(() {
                          Get.to(CameraScreen());
                        });
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

}



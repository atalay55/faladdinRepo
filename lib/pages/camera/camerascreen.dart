import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fortune/pages/camera/photosend.dart';
import 'package:get/get.dart';


class CameraScreen extends StatefulWidget {

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? cameraController;
  late List<CameraDescription> cameras;
  late Future<void> _initializeControllerFuture;
  late     StreamSubscription<double>? _subscription;

  @override
  void initState() {

    startCamera(direction);


  }
  Future<void> capturePhoto() async {
    if (cameraController != null && cameraController!.value.isInitialized) {
      try {
        final image = await cameraController!.takePicture();
        final String imagePath = image.path;
        setState(() {
          Get.to(PhotoSend(imageFile: File(imagePath)));
        });
      } catch (e) {
        print('Error taking picture: $e');
      }
    }
  }
  int direction = 0;
  void startCamera(int direction) async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }

      cameraController!.setFocusMode(FocusMode.auto);

      setState(() {}); //To refresh widget
    }).catchError((e) {
      print(e);
    });
  }




  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }
    if (cameraController!.value.isInitialized) {
      return Scaffold(
        body: GestureDetector(
          onDoubleTap: (){
            setState(() {
              direction = direction == 0 ? 1 : 0;
              startCamera(direction);
            });
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
                  SizedBox(
                      height: height,
                      child: CameraPreview(cameraController!)),
                  Padding(
                    padding:  EdgeInsets.all(15),
                    child: CircleAvatar(
                        backgroundColor: Colors.black45 ,
                        radius: width/10,
                        child: IconButton(onPressed: capturePhoto, icon:Icon(Icons.camera_alt_outlined,size: width/12,color: Colors.white70,))),
                  )
                ],
              ),

        )


      );
    } else {
      return const SizedBox();
    }
  }


}
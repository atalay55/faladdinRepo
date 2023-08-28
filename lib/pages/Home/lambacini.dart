import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class LambaCini extends StatefulWidget {
  const LambaCini({Key? key}) : super(key: key);

  @override
  State<LambaCini> createState() => _LambaCiniState();
}

class _LambaCiniState extends State<LambaCini> {double scaleFactor = 1.0;
double maxScaleFactor = 2.0;
bool shouldAnimate = false;
void _resetScale() {
  setState(() {
    scaleFactor = 1.0;
    shouldAnimate = false;
  });
}


final RxInt _fontSize=15.obs ;

@override
Widget build(BuildContext context) {


  return Scaffold(
   backgroundColor: Colors.black87,
    appBar: AppBar(
      backgroundColor: Colors.black,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(icon: FaIcon(FontAwesomeIcons.plusSquare,color: Colors.white,),onPressed:(){
            bottomSheetFontSize(context);
          },),
        )
      ],
      ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding:  EdgeInsets.only(left:Get.width/3.5 ,bottom: Get.width/10),
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                print(details.primaryDelta);
                scaleFactor += details.primaryDelta! > 0? details.primaryDelta! / 1000: 0;
                if (scaleFactor > maxScaleFactor) {
                  shouldAnimate = true;
                } else {
                  shouldAnimate = false;
                }
              });
            },
            onHorizontalDragEnd: (details) {
              _resetScale();
            },
            child: AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child:
                Image.asset("images/lamba.png" ,width:150 * scaleFactor ,height:150 * scaleFactor ,)
              /*
              Container(
                width: 100 * scaleFactor,
                height: 100 * scaleFactor,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Büyüt',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),*/
            ),

          ),
        ),
      ],
    ),
  );
}
void bottomSheetFontSize(BuildContext context,) {
  showModalBottomSheet(
    backgroundColor: Colors.white10,
    shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        )),
    context: context,
    builder: (BuildContext context) {
      return  Container(
        height: Get.height/10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Yazı Tipi Boyutu",style: TextStyle(color: Colors.white ,fontSize: Get.width/22),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove,color:Colors.deepOrangeAccent),
                  onPressed: () {
                    setState(() {
                      double percentage = ((_fontSize.value / 100) * 15).toDouble();
                      if (_fontSize.value > 0) {

                        _fontSize.value= _fontSize.value- percentage.toInt();
                      }
                    });
                  },
                ),
                Obx(() => Text(
                  '%${_fontSize.value.toDouble()}', // Calculate the percentage value
                  style: TextStyle(
                    fontSize: Get.width/22 ,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                IconButton(
                  icon: Icon(Icons.add,color: Colors.deepOrangeAccent,),
                  onPressed: () {
                    double percentage = ((_fontSize.value / 100) * 15).toDouble();
                    setState(() {
                      _fontSize.value =_fontSize.value+ percentage.toInt();
                    });
                  },
                ),
              ],
            ),

            // Add more options as needed
          ],
        ),
      );
    },
  );
}
}





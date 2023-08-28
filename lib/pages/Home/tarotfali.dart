import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fortune/data/tarotdata.dart';
import 'package:fortune/entity/tarot.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TarotFali extends StatefulWidget {
  const TarotFali({Key? key}) : super(key: key);

  @override
  State<TarotFali> createState() => _TarotFaliState();
}

class _TarotFaliState extends State<TarotFali> {
  StreamController<int> selected = StreamController<int>();
  double width = Get.width;
  double height = Get.height;
  @override
  void dispose() {
    selected.close();
    super.dispose();
  }
  final Random _random = Random();
  int previousRandomValue = -1;

  // ... Diğer kodlar ...

  Future<void> performSpin() async {
    Set<int> usedValues = {};

    for (var i = 0; i < 3; i++) {
      int randomValue;
      do {
        randomValue = _random.nextInt(tarots.length);
      } while (usedValues.contains(randomValue) || randomValue == previousRandomValue);
      usedValues.add(randomValue);
      previousRandomValue = randomValue;

      selectedValue = randomValue;
    }
  }

  final List<Tarot> tarots = TarotData().tarots.toList();
  int remainingSpins = 3;
  int selectedValue = 0; // Track the selected value
  bool showSelectedValue = false , firstSelected =false,secondSelected=false, thirdSelected=false;
  List<int> selectedValues = <int>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
              ...selectedValues.sublist(0, min(selectedValues.length, 3)).map((index) =>
                  TarotContainer(tarots[index], width, height, true)),
                if (selectedValues.length < 3)
            ...List.generate(
                3 - selectedValues.length,
                    (index) =>
                    TarotContainer(tarots[selectedValue], width, height, false)),
          ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (remainingSpins > 0) {
                  setState(() {
                    if (selectedValues.isEmpty) {
                      performSpin().then((value) {
                        selected.add(selectedValue);
                        selectedValues.add(selectedValue);
                      });


                    } else if (selectedValues.length < 3) {
                      // 2. ve 3. çevirme
                      performSpin().then((value) {
                        selected.add(selectedValue);
                        selectedValues.add(selectedValue);
                      });

                    } else {
                      // Son çevirme
                      performSpin().then((value) {
                        selected.add(selectedValue);
                        selectedValues.add(selectedValue);
                      });
                      selectedValues.clear(); // Çevirme hakkı bitti, temizle
                      remainingSpins = 0;
                      alert([
                        tarots[selectedValues[0]],
                        tarots[selectedValues[1]],
                        tarots[selectedValues[2]],
                      ]);
                    }
                    remainingSpins--;
                    Future.delayed(Duration(seconds: 5), () {
                      // After spinning, show selected value
                      setState(() {
                        showSelectedValue = true;
                      });
                    });
                  });
                } else {
                  alert([
                    tarots[selectedValues[0]],
                    tarots[selectedValues[1]],
                    tarots[selectedValues[2]]
                  ]);
                }
              }, //
              child: Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: SizedBox(
                  width: width,
                  height: height / 2,
                  child: FortuneWheel(
                    animateFirst: false,
                    selected: selected.stream,
                    indicators: <FortuneIndicator>[
                      FortuneIndicator(
                        alignment: Alignment
                            .center, // <-- changing the position of the indicator
                        child: Transform.rotate(
                          angle: -pi,
                          child: TriangleIndicator(
                            color: Colors
                                .white70, // <-- changing the color of the indicator
                          ),
                        ),
                      ),
                    ],
                    items: [
                      for (var it in tarots)
                        FortuneItem(
                            child: Text(it.name.toString()),
                            style: FortuneItemStyle(
                              color: Colors.white24,
                              borderWidth: 2,
                            )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget TarotContainer(Tarot t, double width, double height, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width / 3.5,
        height: height / 3.5,
        decoration: BoxDecoration(
            image: isSelected
                ? DecorationImage(
                image: AssetImage(t.imagePath ?? ""), fit: BoxFit.cover)
                : null,
            borderRadius: BorderRadius.circular(15),
            color: Colors.white70),
      ),
    );
  }

  alert(List<Tarot> t) {
   showDialog(
     context: context,
     builder: (BuildContext context) {
       return AlertDialog(
         scrollable: true,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(16.0),
         ),
         backgroundColor: Colors.white70,
        titlePadding: EdgeInsets.only(top: 15,left:width/2),
         title:  IconButton(
           onPressed: () {
             remainingSpins = 3;
             selectedValues.clear();
             Navigator.of(context).pop();
           },
           icon: Icon(Icons.clear),
         ),
         content: Column(children: [
           Text(
             t[0].tarotDescription.toString(),
             style: GoogleFonts.corben(color: Colors.black87, fontSize: 25),
           ),
           Text(
             t[1].tarotDescription.toString(),
             style: GoogleFonts.corben(color: Colors.black87, fontSize: 25),
           ),
           Text(
             t[2].tarotDescription.toString(),
             style: GoogleFonts.corben(color: Colors.black87, fontSize: 25),
           ),
         ]),
         actionsAlignment: MainAxisAlignment.start,
         actions: [

         ],
       );
     },
   );

  }
  void startImageDisplayTimer(int seconds, Function() callback) {
    Future.delayed(Duration(seconds: seconds), callback);
  }
}
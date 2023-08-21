import 'package:flutter/material.dart';
import 'package:fortune/models/cardmodel.dart';

import '../models/subjectmodel.dart';

class FalGrid extends StatefulWidget {
  const FalGrid({Key? key}) : super(key: key);

  @override
  State<FalGrid> createState() => _FalGridState();
}

class _FalGridState extends State<FalGrid> {
  List<Subject> subjects=<Subject>[
    new Subject(title: "Kahve Falı", imagePath: "images/kahveresmi.png"),
    new Subject(title: "Niyetime İç", imagePath: "images/niyetimeiç.png"),
    new Subject(title: "Tarot Falı", imagePath: "images/tarotfalı.png"),
    new Subject(title: "Lamba Cini", imagePath: "images/lambacini.png"),
    new Subject(title: "Biyoritim ", imagePath: "images/biyoritim.png"),
    new Subject(title: "Günlük Aşk Uyumu", imagePath: "images/günlükask.png"),
    new Subject(title: "Günlük Motivasyon ", imagePath: "images/günlükmotivation.png"),
    new Subject(title: "Ay Takvimi ", imagePath: "images/aytakvimi.png"),

  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        childAspectRatio: 1.4,
        mainAxisSpacing: 5

      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return CardModel(subject: subjects[index]);
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../entity/tarot.dart';

class DraggableWidget extends StatefulWidget {
  final Tarot tarot;
  DraggableWidget({required this.tarot});

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  @override
  Widget build(BuildContext context) {
    return Draggable<Tarot>(
      data: widget.tarot,
      child: Container(
        width: 75,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/tarotfalı.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // Add your content here (e.g., text, additional widgets)
          child: Text(""),
        ),
      ),
      feedback: Container(
        width: 75,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/tarotfalı.png'),
            fit: BoxFit.cover,
          ),
          color: Colors.blue.withOpacity(0.5),
        ),
        child: Center(
          child: Text(""),
        ),
      ),
      childWhenDragging: Container(),
      affinity: Axis.vertical,
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class ExpandWidget extends StatefulWidget {
  @override
  _ExpandWidgetState createState() => _ExpandWidgetState();
}

class _ExpandWidgetState extends State<ExpandWidget> {
  double _height = 100;

  @override
  Widget build(BuildContext context) {
    var card = 
      Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 8,),
                Expanded(
                  child: Text("Chung"),
                  ),
                Container(
                  child: Ink(
                    decoration: ShapeDecoration(
                      // color: Colors.lightBlue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          // Create a random number generator.
                          final random = Random();

                          var randomVal = random.nextInt(300).toDouble();

                          if (randomVal >= 100) _height = randomVal;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8,)
            ],),
            Text("Chung"),
            Text("Chung"),
          ],
        ),
      );
    return 
      AnimatedContainer(
        // Use the properties stored in the State class.
        height: _height,
        // Define how long the animation should take.
        duration: Duration(seconds: 1),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastOutSlowIn,
        child: card,
      );
  }
}
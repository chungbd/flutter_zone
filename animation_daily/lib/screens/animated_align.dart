import 'package:animation_daily/constrains/screens.dart';
import 'package:flutter/material.dart';

import 'base_screen.dart';

class AnimatedAlignScreen extends BaseScreen {
  const AnimatedAlignScreen({Key? key, this.infor}) : super(key: key);

  @override
  _AnimatedAlignScreenState createState() => _AnimatedAlignScreenState();

  @override
  final ScreenInfor? infor;
}

class _AnimatedAlignScreenState extends State<AnimatedAlignScreen>
    with ScaffoldBase {
  @override
  Widget createBody(BuildContext context) {
    return Animation5();
  }
}

class Animation5 extends StatefulWidget {
  const Animation5({Key? key}) : super(key: key);

  @override
  _Animation5State createState() => _Animation5State();
}

class _Animation5State extends State<Animation5> {
  bool selected = false;
  double iconSize = 100;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 180.0,
          color: Colors.blue,
        ),
        SizedBox(
          width: double.infinity,
          height: 180.0 + iconSize / 3,
          child: AnimatedAlign(
            alignment: selectAlignment(),
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: changeAlignment,
              child: profilePicture(),
            ),
          ),
        ),
      ],
    );
  }

  Widget profilePicture() => Container(
        decoration: BoxDecoration(
          color: Colors.black45,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.account_circle_sharp,
          size: iconSize,
          color: Colors.blue,
        ),
      );

  changeAlignment() {
    setState(() {
      selected = !selected;
    });
  }

  selectAlignment() => selected ? Alignment.bottomLeft : Alignment.bottomCenter;
}

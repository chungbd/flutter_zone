import 'package:animation_daily/constrains/screens.dart';
import 'package:flutter/material.dart';

import 'base_screen.dart';

class AnimatedPositionedScreen extends BaseScreen {
  const AnimatedPositionedScreen({Key? key, this.infor}) : super(key: key);

  final ScreenInfor? infor;

  @override
  _AnimatedPositionedScreenState createState() =>
      _AnimatedPositionedScreenState();
}

enum Positions { bottom, top, all }

class _AnimatedPositionedScreenState extends State<AnimatedPositionedScreen>
    with ScaffoldBase {
  Positions _position = Positions.bottom;

  @override
  Widget createBody(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            top: topPosition(height),
            bottom: bottomPosition(height),
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: changePosition,
              child: _customBottomAppBar(width),
            ),
          ),
        ],
      ),
    );
  }

  @override
  String? get titleScreen => widget.infor?.name;

  bottomPosition(double height) =>
      _position == Positions.top ? height - 150.0 : 0.0;

  topPosition(double height) =>
      _position == Positions.bottom ? height - 180.0 : 0.0;

  changePosition() {
    setState(() {
      switch (_position) {
        case Positions.bottom:
          _position = Positions.top;
          break;
        case Positions.top:
          _position = Positions.all;
          break;
        case Positions.all:
          _position = Positions.bottom;
          break;
      }
    });
  }

  Widget _customBottomAppBar(double width) => Container(
        width: width,
        color: Colors.blue,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
}

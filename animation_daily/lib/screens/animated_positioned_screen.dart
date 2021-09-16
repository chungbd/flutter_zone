import 'package:animation_daily/constrains/screens.dart';
import 'package:flutter/material.dart';

import 'base_screen.dart';

class AnimatedPositionedScreen extends StatefulWidget {
  const AnimatedPositionedScreen({Key? key, this.infor}) : super(key: key);

  final ScreenInfor? infor;

  @override
  _AnimatedPositionedScreenState createState() =>
      _AnimatedPositionedScreenState();
}

class _AnimatedPositionedScreenState extends State<AnimatedPositionedScreen>
    with ScaffoldBase {
  @override
  Widget createBody(BuildContext context) {
    return const Text("data");
  }

  @override
  String? get titleScreen => widget.infor?.name;
}

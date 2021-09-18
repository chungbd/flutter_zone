import 'package:animation_daily/constrains/screens.dart';
import 'package:animation_daily/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class AnimatedDefaultTextStyleScreen extends StatefulWidget {
  const AnimatedDefaultTextStyleScreen({Key? key, this.infor})
      : super(key: key);

  final ScreenInfor? infor;

  @override
  _AnimatedDefaultTextStyleScreenState createState() =>
      _AnimatedDefaultTextStyleScreenState();
}

class _AnimatedDefaultTextStyleScreenState
    extends State<AnimatedDefaultTextStyleScreen> with ScaffoldBase {
  bool selected = false;
  TextStyle textStyle1 = const TextStyle(
    color: Colors.blue,
    fontSize: 90,
    letterSpacing: 2,
    fontWeight: FontWeight.w900,
  );

  TextStyle textStyle2 = const TextStyle(
    color: Colors.orange,
    fontSize: 140,
    fontWeight: FontWeight.w300,
  );

  @override
  Widget createBody(BuildContext context) {
    return AnimatedDefaultTextStyle(
      child: const Text("TEXT"),
      style: selected ? textStyle1 : textStyle2,
      duration: const Duration(seconds: 1),
    ).center().gestures(onTap: changeTextStyle);
  }

  changeTextStyle() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  String? get titleScreen => widget.infor?.name ?? "";
}

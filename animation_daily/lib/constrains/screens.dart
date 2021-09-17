import 'package:flutter/widgets.dart';

import '../screens/animated_positioned_screen.dart';
import '../screens/animated_size_screen.dart';

class ScreenInfor {
  final String name;
  final String description;
  final Widget Function(ScreenInfor? infor) instance;
  const ScreenInfor({
    required this.name,
    required this.description,
    required this.instance,
  });
}

List<ScreenInfor> screens = [
  ScreenInfor(
      name: "Day 2: Animated Positioned",
      description:
          """With AnimatedPositioned, we can change the property of size: 
          the padding of top, bottom, left and right; 
          Size of Container: width, hight.
          """,
      instance: (infor) => AnimatedPositionedScreen(
            infor: infor,
          )),
  ScreenInfor(
      name: "Day 1: Animated Size",
      description: "The animation only will appears the first time!",
      instance: (infor) => AnimatedSizeScreen(
            infor: infor,
          )),
];

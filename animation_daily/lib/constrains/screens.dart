import 'package:flutter/widgets.dart';

import '../screens/animated_align.dart';
import '../screens/animated_container.dart';
import '../screens/animated_default_text_style.dart';
import '../screens/animated_opacity.dart';
import '../screens/animated_positioned.dart';
import '../screens/animated_size_screen.dart';
import '../screens/curved_navigation_bar.dart';
import '../screens/elatis_drawer.dart';

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
      name: "Day 8: Curved Navigation Bar",
      description: "",
      instance: (infor) => CurvedNavigationBarScreen(
            infor: infor,
          )),
  ScreenInfor(
      name: "Day 7: Elatis Drawer",
      description: """
          """,
      instance: (infor) => ElatisDrawer(
            infor: infor,
          )),
  ScreenInfor(
      name: "Day 6: Animated Opacity",
      description: """
          """,
      instance: (infor) => AnimatedOpacityScreen(
            infor: infor,
          )),
  ScreenInfor(
      name: "Day 5: Animated Align",
      description: """
          """,
      instance: (infor) => AnimatedAlignScreen(
            infor: infor,
          )),
  ScreenInfor(
      name: "Day 4: Animated Container",
      description: """
          """,
      instance: (infor) => AnimatedContainerScreen(
            infor: infor,
          )),
  ScreenInfor(
      name: "Day 3: Animated Default Text Style",
      description: """
          """,
      instance: (infor) => AnimatedDefaultTextStyleScreen(
            infor: infor,
          )),
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

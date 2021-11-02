import 'package:animation_daily/constrains/screens.dart';
import 'package:animation_daily/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipeScreen extends BaseScreen {
  const LiquidSwipeScreen({this.infor, Key? key}) : super(key: key);

  @override
  final ScreenInfor? infor;
  @override
  _LiquidSwipeScreenState createState() => _LiquidSwipeScreenState();
}

class _LiquidSwipeScreenState extends State<LiquidSwipeScreen>
    with ScaffoldBase {
  final pages = [
    Image.network(
        "https://images.unsplash.com/photo-1634193295627-1cdddf751ebf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80",
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover),
    Image.network(
        "https://images.unsplash.com/photo-1634195130430-2be61200b66a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80",
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover),
  ];

  @override
  Widget createBody(BuildContext context) {
    return LiquidSwipe(
      pages: pages,
      fullTransitionValue: 880,
      waveType: WaveType.circularReveal,
      slideIconWidget: Icon(Icons.arrow_back_ios, color: Colors.white),
      positionSlideIcon: 0.5,
      liquidController: LiquidController(),
    );
  }
}

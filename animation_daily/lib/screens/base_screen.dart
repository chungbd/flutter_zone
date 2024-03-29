import 'package:animation_daily/constrains/screens.dart';
import 'package:flutter/material.dart';

mixin ScaffoldBase<Screen extends BaseScreen> on State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.infor?.name ?? ""),
        ),
        body: WillPopScope(
          child: createBody(context),
          onWillPop: () => Future.value(willPop),
        ));
  }

  Widget createBody(BuildContext context);

  bool get willPop {
    return true;
  }
}

abstract class ScreenBase {
  final ScreenInfor? infor;

  ScreenBase({this.infor});
}

abstract class BaseScreen extends StatefulWidget implements ScreenBase {
  const BaseScreen({Key? key}) : super(key: key);
}

import 'package:flutter/material.dart';

mixin ScaffoldBase<Screen extends StatefulWidget> on State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titleScreen ?? ""),
        ),
        body: createBody(context));
  }

  String? get titleScreen;

  Widget createBody(BuildContext context);
}

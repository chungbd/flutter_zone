import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constrains/screens.dart';
import 'base_screen.dart';

class ElatisDrawer extends BaseScreen {
  // ignore: prefer_const_constructors_in_immutables
  ElatisDrawer({this.infor, Key? key}) : super(key: key);

  @override
  _ElatisDrawerState createState() => _ElatisDrawerState();

  @override
  final ScreenInfor? infor;
}

class _ElatisDrawerState extends State<ElatisDrawer> with ScaffoldBase {
  @override
  Widget createBody(BuildContext context) {
    return ElasticDrawer(
      mainColor: Colors.white,
      drawerColor: Colors.black,
      mainChild: Column(children: [
        Expanded(
            child: Image.network(
                "https://images.unsplash.com/photo-1634193295627-1cdddf751ebf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80",
                fit: BoxFit.cover)),
      ]),
      drawerChild: Column(children: [
        Expanded(
            child: Image.network(
                "https://images.unsplash.com/photo-1634195130430-2be61200b66a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80",
                fit: BoxFit.cover)),
      ]),
    );
  }

  @override
  bool get willPop => false;
}

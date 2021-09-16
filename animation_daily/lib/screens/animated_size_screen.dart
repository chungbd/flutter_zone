import 'package:animation_daily/constrains/screens.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class AnimatedSizeScreen extends StatefulWidget {
  const AnimatedSizeScreen({Key? key, this.infor}) : super(key: key);

  final ScreenInfor? infor;

  @override
  _AnimatedSizeScreenState createState() => _AnimatedSizeScreenState();
}

class _AnimatedSizeScreenState extends State<AnimatedSizeScreen> {
  String url =
      "https://images.unsplash.com/photo-1609017910188-993211b015d6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fHBhcnJvdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.infor?.name ?? ""),
      ),
      body: AnimatedSize(
        reverseDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 1),
        child: Image.network(
          url,
        ).constrained(width: double.infinity).alignment(Alignment.center),
      ),
    );
  }
}

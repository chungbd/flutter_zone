import 'package:flutter/material.dart';

class Sanbox extends StatefulWidget {
  Sanbox({Key key}) : super(key: key);

  @override
  _SanboxState createState() => _SanboxState();
}

class _SanboxState extends State<Sanbox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(child: Text("Animate margin"), onPressed: () => setState(() => _margin = 50)),
            RaisedButton(child: Text("Animate color"), onPressed: () => setState(() => _color = Colors.blue)),
            RaisedButton(child: Text("Animate with"), onPressed: () => setState(() => _width = 270)),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: RaisedButton(child: Text("Animate opacity"), onPressed: () => setState(() => _opacity = 0.5)),
            )
          ],
        ),
      ),
    );
  }
}

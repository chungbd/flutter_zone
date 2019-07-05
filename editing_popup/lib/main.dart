import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            title: 'Flutter Demo',
            theme: new ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: new MyHomePage(title: 'Flutter Demo Home Page'),
        );
    }
}

class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);
    final String title;

    @override
    _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text('49715760 Stackoverflow'),
            ),
            body: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    new Expanded(
                        child: new Material(
                            color: Colors.grey,
                            child: new Text("Filled"),
                        ),
                    ),
                    new Container(
                        color: Colors.white,
                        padding: new EdgeInsets.all(10.0),
                        child: new TextField(
                            decoration: new InputDecoration(
                                hintText: 'Chat message',
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}
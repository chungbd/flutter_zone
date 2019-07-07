import 'package:editing_popup/input_popup.dart';
import 'package:editing_popup/rule.dart';
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
            home: HomePage(),
        );
    }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var body = Container(
          child: 
            Center(
              child: 
                RaisedButton(
                  child: Text("Show input popup"),
                  onPressed: () {
                        var inputPopup = InputPopup(
                          labelTitle: "Ngày tháng năm sinh(*)",
                          listRule: [Rule.notEmpty],
                          onSubmitText: (value) {
                            print("onSubmitText $value");
                          },
                        );

                        Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                                return inputPopup;
                            }
                        ));
                  },
                ),
            ),
        );
    var scafold = Scaffold(
      body: body,
    );
    return scafold;
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
                            autofocus: true,
                            decoration: new InputDecoration(
                                hintText: 'Chat message',
                            ),
                        ),
                    ),
                    new Container(
                        color: Colors.white,
                        padding: new EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        child: 
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: 
                                  RaisedButton(onPressed: () {

                                  },),
                              ),
                              SizedBox(width: 8,),
                              Expanded(
                                child: 
                                  RaisedButton(onPressed: () {

                                  },),
                              ),                             
                            ],)
                    ),                    
                ],
            ),
        );
    }
}
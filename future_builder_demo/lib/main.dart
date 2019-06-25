import 'package:async/async.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AsyncMemoizer _memoizer = AsyncMemoizer();
  bool _switchValue;

  @override
  void initState() {
    super.initState();
    this._switchValue = false;
  }

  // @override
  // void didUpdateWidget(HomeScreen oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.future != widget.future) {
  //     if (_activeCallbackIdentity != null) {
  //       _unsubscribe();
  //       _snapshot = _snapshot.inState(ConnectionState.none);
  //     }
  //     _subscribe();
  //   }
  // }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Switch(
            value: this._switchValue,
            onChanged: (newValue) {
              setState(() {
                this._switchValue = newValue;
              });
            },
          ),
          FutureBuilder(
              future: _fetchData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator()
                    );
                  default:
                    return Center(
                      child: Text(snapshot.data)
                    );
                }
              }
          ),
        ],
      ),
    );
  }

  _fetchData() async {
    return this._memoizer.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));
      print("_fetchData");
      _memoizer = AsyncMemoizer();
      return 'REMOTE DATA';
    });
    // await Future.delayed(Duration(seconds: 2));
    // return 'REMOTE DATA';
  }
}
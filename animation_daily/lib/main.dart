import 'package:animation_daily/constrains/screens.dart';
import 'package:animation_daily/constrains/size.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Animation',
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
      home: const MyHomePage(title: 'Daily Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView.builder(
            itemCount: screens.length,
            itemBuilder: (BuildContext context, int index) {
              final infor = screens[index];
              return ScreenItem(infor: infor);
            },
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class ScreenItem extends StatefulWidget {
  const ScreenItem({Key? key, this.infor}) : super(key: key);

  final ScreenInfor? infor;

  @override
  _ScreenItemState createState() => _ScreenItemState();
}

class _ScreenItemState extends State<ScreenItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_function_declarations_over_variables
    final settingsItem = ({required Widget child}) =>
        Styled.widget(child: child)
            .alignment(Alignment.center)
            .ripple()
            .backgroundColor(Colors.white, animate: true)
            .clipRRect(all: 25) // clip ripple
            .borderRadius(all: 25, animate: true)
            .elevation(
              pressed ? 0 : 20,
              borderRadius: BorderRadius.circular(25),
              shadowColor: const Color(0x30000000),
            ) // shadow borderRadius
            .constrained(height: 80)
            .padding(
                vertical: SizeConstrain.paddingNormal,
                horizontal: SizeConstrain.paddingNormal) // margin
            .gestures(
              onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
              onTapDown: (details) => print('tapDown'),
              onTap: _goToScreen,
            )
            .scale(all: pressed ? 0.95 : 1.0, animate: true)
            .animate(const Duration(milliseconds: 150), Curves.easeOut);

    return settingsItem(
        child: Text(
      widget.infor?.name ?? "Null",
      style: const TextStyle(fontSize: 18),
    ));
  }

  _goToScreen() {
    final infor = widget.infor;
    if (infor != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => infor.instance(infor),
          ));
    }
  }
}

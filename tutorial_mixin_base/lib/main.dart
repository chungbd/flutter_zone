import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

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
      home: MyHomePage(),
    );
  }
}


abstract class BasePage<Bloc extends BaseBloc> extends StatefulWidget {
  final Bloc bloc;
  BasePage({Key key, this.bloc}) : super(key: key);
}

abstract class BaseState<Page extends BasePage> extends State<Page> {
  String screenName();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
}


mixin BasicPage<Page extends BasePage> on BaseState<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(screenName()),
        ),
        body: Container(
          child: body(),
          color: Colors.amber,
        ),
        floatingActionButton: fab(),
        );
  }
  Widget fab() => Container();
  Widget body();
}

class MyHomePage extends BasePage {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseState<MyHomePage> with BasicPage, ErrorHandlingMixin {
  @override
  String screenName() => "Home";

  @override
  Widget body() {
    showErrorSnackbar("event", scaffoldKey.currentState);
    return Center(child: Text("This is a basic usage of a mixin"));
  }

  @override
  Widget fab() => FloatingActionButton(
    child: Icon(Icons.error),
    onPressed: () => widget.bloc.errorSink.add("A new error!"),
);
}

abstract class BaseBloc {
  /// relays error information
  final _errorSubject = PublishSubject<String>();

  Sink<String> get errorSink => _errorSubject.sink;

  Stream<String> get errorStream => _errorSubject.stream;
}

class HomeBloc extends BaseBloc {}

mixin ErrorHandlingMixin<Page extends BasePage> on BaseState<Page> {
  @override
  void initState() {
    super.initState();
    widget.bloc.errorStream
			// this will preven multiple messages from showing up in a short interval of time
        .transform(new ThrottleStreamTransformer((_) => TimerStream(true, const Duration(seconds: 2))))
        .listen((error) => showErrorSnackbar(error, scaffoldKey.currentState));
  }

  void showErrorSnackbar(String event, ScaffoldState context) {
    if (event != null) {
      context.showSnackBar(new SnackBar(
        content: new Text(event),
      ));
    }
  }
}
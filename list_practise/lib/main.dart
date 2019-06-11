import 'package:flutter/material.dart';

void main() {
  runApp(MyApp3());
}

class MyApp3 extends StatelessWidget {
  List<Widget> itemViews = [];
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: DemoHome(),
    );
  }


}

class DemoHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _DemoHomeState();
  }
  
}

class _DemoHomeState extends State<DemoHome> {
  List<Widget> itemViews = [];
  GlobalKey _keyListView = GlobalKey();
  double boxHeigh = 100;
  double boxWidth = 100;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    final RenderBox renderBoxRed = _keyListView.currentContext.findRenderObject();
    final sizeRed = renderBoxRed.size;
    print("SIZE of Red: $sizeRed");

    var eachWidth = sizeRed.width/3;
    setState(() {
      boxHeigh = eachWidth;
      boxWidth = eachWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
        appBar: AppBar(
          title: Text("Dynamic list"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: boxHeigh,
              child: Scrollbar(
                child: ListView.builder(
                  key: _keyListView,
                  scrollDirection: Axis.horizontal,
                  itemCount: itemViews.length,
                  itemBuilder: (context, index) {
                    return _createItemView();
                  },
              ),
              ),
            )
          ],
        )
,
        floatingActionButton: fab(),
      );
  }

  Widget fab() => FloatingActionButton(
      child: Icon(Icons.add_box),
      onPressed: () {
        setState(() {
          itemViews.add(_createItemView());
        });
      },
  );

  Widget _createItemView() {
    return Card(
      child: SizedBox(
        height: boxHeigh,
        width: boxWidth,
        child: IconButton(
          icon: Icon(Icons.add_a_photo),
          color: Colors.blue,
          onPressed: () {
          
          },
        ),
      ),
    );

  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 4,
          // Generate 100 Widgets that display their index in the List
          children: List.generate(100, (index) {
            return Card(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.red,
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp2 extends StatelessWidget {
  MyApp2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Floating App Bar';

    return MaterialApp(
      title: title,
      home: Scaffold(
        // No appbar provided to the Scaffold, only a body with a
        // CustomScrollView
        body: CustomScrollView(
          slivers: <Widget>[
            // Add the app bar to the CustomScrollView
            SliverAppBar(
              // Provide a standard title
              title: Text(title),
              // Allows the user to reveal the app bar if they begin scrolling
              // back up the list of items
              floating: true,
              // Display a placeholder Widget to visualize the shrinking size
              flexibleSpace: Placeholder(),
              // Make the initial height of the SliverAppBar larger than normal
              expandedHeight: 200,
            ),
            // Next, create a SliverList
            SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that
                // displays the index of the current item
                (context, index) => ListTile(title: Text('Item #$index')),
                // Builds 1000 ListTiles
                childCount: 1000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
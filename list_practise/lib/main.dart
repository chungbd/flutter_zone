import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MyApp3(
    camera: firstCamera,
  ));
}

class MyApp3 extends StatelessWidget {
  final CameraDescription camera;

  MyApp3({ @required this.camera});

  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: DemoHome(
        camera: camera,
      ),
    );
  }


}

class DemoHome extends StatefulWidget {
  final CameraDescription camera;

  const DemoHome({
    Key key,
    @required this.camera,
  }) : super(key: key);

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
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  
  File _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
  String _retrieveDataError;

  @override
  void initState() {
    onPressFloatingBtn();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();

        _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
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

  void _onImageButtonPressed(ImageSource source) async {
    if (_controller != null) {
    }

    try {
      _imageFile = await ImagePicker.pickImage(source: source);
    } catch (e) {
      _pickImageError = e;
    }
    setState(() {
      itemViews.add(_createImageItem(_imageFile));
    });
  }



  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: AppBar(
          title: Text("Dynamic list"),
        ),
        body: buildGridView(),
        floatingActionButton: fab(),
      );
  }

        //   Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: <Widget>[
        //     Container(
        //       height: boxHeigh,
        //       child: Scrollbar(
        //         child: ListView.builder(
        //           key: _keyListView,
        //           scrollDirection: Axis.horizontal,
        //           itemCount: itemViews.length,
        //           itemBuilder: (context, index) {
        //             return _createItemView();
        //           },
        //       ),
        //       ),
        //     )
        //   ],
        // )

    Widget buildGridView() {
      return GridView.count(
        key: _keyListView,
        crossAxisCount: 3,
        children: List.generate(itemViews.length, (index) {
          var itemView = itemViews[index];
          return itemView;
        }),
      );
    }

    onPressFloatingBtn() {
      setState(() {
        itemViews.add(_createTakePictureItem());
      });
    }

  onPressTakepicture() async {
    _onImageButtonPressed(ImageSource.camera);
    return;

    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Construct the path where the image should be saved using the 
      // pattern package.
      final path = join(
        // Store the picture in the temp directory.
        // Find the temp directory using the `path_provider` plugin.
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      // Attempt to take a picture and log where it's been saved.
      await _controller.takePicture(path);

      // If the picture was taken, display it on a new screen.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(imagePath: path),
        ),
      );
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  Widget fab() => FloatingActionButton(
      child: Icon(Icons.add_box),
      onPressed: onPressFloatingBtn,
  );

  Widget _createTakePictureItem() {
    return Card(
      child: SizedBox(
        height: boxHeigh,
        width: boxWidth,
        child: IconButton(
          icon: Icon(Icons.add_a_photo),
          color: Colors.blue,
          onPressed: onPressTakepicture,
        ),
      ),
    );
  }

  Widget _createImageItem(File imgFile) {
    return Card(
      child: SizedBox(
        height: boxHeigh,
        width: boxWidth,
        child: Image.file(imgFile),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
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
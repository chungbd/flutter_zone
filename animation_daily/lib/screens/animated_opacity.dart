import 'package:animation_daily/constrains/screens.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'base_screen.dart';

List<String> urlList = [
  "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2VsZmllJTIwZ2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1543486958-d783bfbf7f8e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2VsZmllfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://image.winudf.com/v2/image1/Y29tLmdvbGRkZXguaGRzZWxmaWVjYW1lcmFfc2NyZWVuXzNfMTU1Mjg3ODE0N18wOTA/screen-3.jpg?fakeurl=1&type=.jpg",
  "https://images.unsplash.com/photo-1598966739654-5e9a252d8c32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHNlbGZpZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://ak.picdn.net/shutterstock/videos/17533732/thumb/1.jpg",
];

class AnimatedOpacityScreen extends BaseScreen {
  const AnimatedOpacityScreen({Key? key, this.infor}) : super(key: key);

  @override
  _AnimatedOpacityScreenState createState() => _AnimatedOpacityScreenState();

  @override
  final ScreenInfor? infor;
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen>
    with ScaffoldBase {
  @override
  Widget createBody(BuildContext context) {
    return Animation7();
  }
}

class Animation7 extends StatefulWidget {
  const Animation7({Key? key}) : super(key: key);

  @override
  _Animation7State createState() => _Animation7State();
}

class _Animation7State extends State<Animation7> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double opacityLevel = 1.0;

  bool _instagramView = false;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  void _changeOpacityInstagram({required int index}) {
    setState(() =>
        opacityLevelInsta[index] = opacityLevelInsta[index] == 0 ? 1.0 : 0.0);
  }

  List<double> opacityLevelInsta =
      List.generate(urlList.length, (index) => 1.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Animation 7",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              setState(() {
                _instagramView = !_instagramView;
              });
            },
            icon: Icon(Icons.swap_horizontal_circle_outlined),
          )
        ],
      ),
      body: _instagramView
          ? _buildInstagramView()
          : Center(
              child: AnimatedOpacity(
                opacity: opacityLevel,
                duration: const Duration(seconds: 2),
                child: GestureDetector(
                  onTap: _changeOpacity,
                  child: flutterLogo(),
                ),
              ),
            ),
    );
  }

  Widget flutterLogo() => const FlutterLogo(
        size: 200,
      );

  Widget _buildInstagramView() {
    double size = 130;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          urlList.length,
          (index) => Container(
            margin:
                EdgeInsets.only(top: 10, left: index == 0 ? 10 : 0, right: 10),
            width: size,
            height: size,
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: opacityLevelInsta[index],
                  duration: const Duration(seconds: 1),
                  child: AnimatedBuilder(
                    animation: _controller,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: const [Colors.red, Colors.purple],
                        ),
                      ),
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: _controller.value * 2.0 * math.pi,
                        child: child,
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _changeOpacityInstagram(index: index);
                  },
                  child: Center(
                    child: CircleAvatar(
                      radius: size * 0.44,
                      backgroundImage: NetworkImage(urlList[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

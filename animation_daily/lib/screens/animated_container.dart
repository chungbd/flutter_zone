import 'package:animation_daily/constrains/screens.dart';
import 'package:animation_daily/screens/base_screen.dart';
import 'package:flutter/material.dart';

class AnimatedContainerScreen extends BaseScreen {
  const AnimatedContainerScreen({Key? key, this.infor}) : super(key: key);

  @override
  final ScreenInfor? infor;

  @override
  _AnimatedContainerScreenState createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen>
    with ScaffoldBase {
  bool largeView = false;
  bool hideText = false;
  bool buttonLock = false;
  String text =
      "Today I picture this amazing location with my camera. This is one of the most beautiful place I have ever seen. I will go back on day to take a new picture";
  final List<String> _urlList = [
    "https://assets.hongkiat.com/uploads/nature-photography/autumn-poolside.jpg",
    "https://www.mickeyshannon.com/photos/fine-art-nature-photography.jpg",
    "https://composeclick.com/wp-content/uploads/2018/05/nature-1.jpg",
    "https://cdn.theatlantic.com/media/img/photo/2020/11/top-shots-2020-international-landsc/a01_Yuen_MagicalNight-1/original.jpg",
    "https://static.boredpanda.com/blog/wp-content/uploads/2015/05/travel-nature-photography-depression-rescue-william-patino6.jpg",
    "https://www.69dropsstudio.co.uk/wp-content/uploads/2018/05/nature-photography-at-its-best.jpeg",
  ];
  @override
  Widget createBody(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: buttonLock || !largeView
                      ? null
                      : () {
                          setState(() {
                            largeView = false;
                            buttonLock = true;
                            hideText = true;
                          });
                        },
                  icon: RotatedBox(
                    child: Icon(
                      Icons.view_agenda_outlined,
                      color: Colors.white,
                    ),
                    quarterTurns: 1,
                  ),
                ),
                IconButton(
                  onPressed: buttonLock || largeView
                      ? null
                      : () {
                          setState(() {
                            largeView = true;
                            buttonLock = true;
                          });
                        },
                  icon: Icon(
                    Icons.view_agenda_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ...List.generate(
            _urlList.length,
            (index) => Wrap(
              alignment: WrapAlignment.start,
              children: [
                AnimatedContainer(
                  onEnd: changeView,
                  width: changeWidth(width),
                  height: changeHeight(),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOutQuart,
                  child: Image.network(
                    _urlList[index],
                    fit: BoxFit.cover,
                  ),
                ),
                showText() ? textWidget(width) : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  String? get titleScreen => widget.infor?.name;

  Widget textWidget(width) => Container(
        width: width / 2,
        padding: EdgeInsets.all(5),
        child: Text(
          text,
        ),
      );
  showText() => !largeView && !hideText;
  changeHeight() => largeView ? 250.0 : 150.0;
  changeWidth(width) => largeView ? width : width / 2;
  changeView() {
    setState(() {
      hideText = false;
      buttonLock = false;
    });
  }
}

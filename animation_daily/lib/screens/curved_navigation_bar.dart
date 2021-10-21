import 'package:animation_daily/constrains/screens.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CurvedNavigationBarScreen extends HookWidget {
  CurvedNavigationBarScreen({
    this.infor,
    Key? key,
  }) : super(key: key);
  final ScreenInfor? infor;

  final items = <Widget>[
    Icon(
      Icons.home,
      size: 30,
    ),
    Icon(
      Icons.search,
      size: 30,
    ),
    Icon(
      Icons.favorite,
      size: 30,
    ),
    Icon(
      Icons.settings,
      size: 30,
    ),
    Icon(
      Icons.person,
      size: 30,
    ),
  ];

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    final currIndex = useState(0);

    return Scaffold(
      // backgroundColor: Colors.red,
      extendBody: true,
      appBar: AppBar(
        title: Text(infor?.name ?? ""),
        elevation: 0,
      ),
      body: Stack(children: [
        Image.network(
            "https://images.unsplash.com/photo-1595136937061-0e07e076b012?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${currIndex.value}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  navigationKey.currentState?.setPage(0);
                },
                child: Text("Go to 0"))
          ],
        )),
      ]),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: Colors.blue,
          backgroundColor: Colors.transparent,
          items: items,
          height: 60,
          index: currIndex.value,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (idx) => currIndex.value = idx,
        ),
      ),
    );
  }
}

// class CurvedNavigationBarScreen extends BaseScreen {
//   const CurvedNavigationBarScreen({
//     Key? key,
//     this.infor,
//   }) : super(key: key);

//   @override
//   final ScreenInfor? infor;

//   @override
//   _CurvedNavigationBarState createState() => _CurvedNavigationBarState();
// }

// class _CurvedNavigationBarState extends State<CurvedNavigationBarScreen> {
//   final items = <Widget>[
//     Icon(
//       Icons.home,
//       size: 30,
//     ),
//     Icon(
//       Icons.search,
//       size: 30,
//     ),
//     Icon(
//       Icons.favorite,
//       size: 30,
//     ),
//     Icon(
//       Icons.settings,
//       size: 30,
//     ),
//     Icon(
//       Icons.person,
//       size: 30,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         title: Text(widget.infor?.name ?? ""),
//         elevation: 0,
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         items: items,
//         height: 60,
//       ),
//     );
//   }
// }

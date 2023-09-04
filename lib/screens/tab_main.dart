import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:meister2/screens/tab_alert.dart';
import 'package:meister2/screens/tab_mypage.dart';
import 'package:meister2/screens/tab_post.dart';

class TabMain extends StatefulWidget {
  const TabMain({Key? key}) : super(key: key);

  @override
  State<TabMain> createState() => _TabMainState();
}

class _TabMainState extends State<TabMain> {

  var currentIdx = 0; // 탭 페이지 체크용 index

  // currentIdx 에 따라서 보여줄 Tab 페이지
  final List<Widget> _widgetOptions = <Widget>[
    TabPost(),
    TabAlert(),
    TabMyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        child: _widgetOptions.elementAt(currentIdx), // currentIdx 에 따라 변하는 페이지
      ),
      bottomNavigationBar: CustomNavigationBar(
        scaleFactor: 0.3,
        iconSize: 30,
        strokeColor: Colors.white,
        backgroundColor: Colors.white,
        items: [
          // 각 하단별 탭 아이콘, 타이틀 구성
          CustomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            title: Text(
              "Community",
            ),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text(
              "Alert",
            ),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text(
              "MyPage",
            ),
          ),
        ],
        currentIndex: currentIdx,
        onTap: (index) {
          // 탭 클릭 시 페이지 전환해주는 부분
          currentIdx = index;
          setState(() {

          });
        },
      ),
    );
  }
}

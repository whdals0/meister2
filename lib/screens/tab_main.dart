import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meister2/globals/custom_colors.dart';
import 'package:meister2/screens/reg_post.dart';

import 'tab_alert.dart';
import 'tab_mypage.dart';
import 'tab_post.dart';

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
        strokeColor: Colors.white,
        backgroundColor: Colors.white,
        items: [
          // 각 하단별 탭 아이콘, 타이틀 구성
          CustomNavigationBarItem(
            selectedIcon: Image.asset(
              "assets/icons/tab1_on.png",
              height: 24,
            ),
            icon: Image.asset(
              "assets/icons/tab1_off.png",
              height: 24,
            ),
            title: Text(
              "Community",
              style: TextStyle(color: Colors.grey[500]),
            ),
            selectedTitle: Text(
              "Community",
              style: TextStyle(color: mainColor),
            ),
          ),
          CustomNavigationBarItem(
            selectedIcon: Image.asset(
              "assets/icons/tab2_on.png",
              height: 24,
            ),
            icon: Image.asset(
              "assets/icons/tab2_off.png",
              height: 24,
            ),
            title: Text(
              "Alert",
              style: TextStyle(color: Colors.grey[500]),
            ),
            selectedTitle: Text(
              "Alert",
              style: TextStyle(color: mainColor),
            ),
          ),
          CustomNavigationBarItem(
            selectedIcon: Image.asset(
              "assets/icons/tab3_on.png",
              height: 24,
            ),
            icon: Image.asset(
              "assets/icons/tab3_off.png",
              height: 24,
            ),
            title: Text(
              "MyPage",
              style: TextStyle(color: Colors.grey[500]),
            ),
            selectedTitle: Text(
              "MyPage",
              style: TextStyle(color: mainColor),
            ),
          ),
        ],
        currentIndex: currentIdx,
        onTap: (index) {
          // 탭 클릭 시 페이지 전환해주는 부분
          currentIdx = index;
          setState(() {});
        },
      ),
      floatingActionButton: currentIdx == 0 ? FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        backgroundColor: mainColor,
        onPressed: _moveRegPost,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ) : null,
    );
  }

  void _moveRegPost() {
    Get.to(RegPost());
  }
}

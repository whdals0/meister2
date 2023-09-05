import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meister2/models/user_leave.dart';
import 'package:meister2/screens/list_alert_setting.dart';
import 'package:meister2/screens/page_edit_myinfo.dart';
import 'package:meister2/screens/page_leave.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../dialogs/dialog_logout.dart';
import '../globals/custom_colors.dart';
import '../globals/custom_functions.dart';
import '../globals/custom_widgets.dart';
import '../globals/globals.dart';

class TabMyPage extends StatefulWidget {
  const TabMyPage({Key? key}) : super(key: key);

  @override
  State<TabMyPage> createState() => _TabMyPageState();
}

class _TabMyPageState extends State<TabMyPage> {
  String version = "";

  @override
  void initState() {
    super.initState();

    getVersion();
  }

  Future<void> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.white,
        elevation: 0,
        title: textM("마이페이지", text1Color, FontWeight.w500),
        actions: [

        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 24),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: mainGray, width: 8))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                      return GestureDetector(
                          onTap: () {
                            ShowImage(userController.user.value.filepath!);
                          },
                          child: loadUserProfile(
                              userController.user.value.filepath, 100));
                    }),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Obx(() {
                              return textL(userController.user.value.nickname,
                                  text2Color, FontWeight.bold);
                            }),
                            textXS(userController.user.value.email, text5Color,
                                FontWeight.normal),
                            IconButton(
                              onPressed: () {
                                Get.to(PageEditMyInfo());
                              },
                              icon: Icon(Icons.settings,
                                size: 24,
                                color: Colors.grey,
                              ),
                              iconSize: 24,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              menuItem(Icon(Icons.notifications_active_rounded), "알림설정", moveToAlertSetting),
              menuItem(Icon(Icons.logout_outlined), "로그아웃", moveToLogout),
              menuItem(Icon(Icons.block_flipped), "회원 탈퇴", moveToLeave),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: ListTile(
                  title: textXS("버전정보", mainColor, FontWeight.normal),
                  trailing:
                      textXS("${version}", mainColor, FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void moveToAlertSetting(){
    Get.to(() => ListAlertSetting());
  }

  Future<void> moveToLogout() async {
    final response = await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return DialogLogout();
      },
    );
  }

  void moveToLeave(){
    Get.to(() => PageLeave());
  }

  Widget menuItem(Icon icon, String title, Function? function) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: ListTile(
        onTap: () async {
          if(function != null){
            function();
          }
        },
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
          ],
        ),
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.only(left: 8),
        title: textXS(title, text3Color, FontWeight.normal),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.chevron_right,
            color: text5Color,
            size: 24,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globals/custom_colors.dart';
import '../globals/custom_widgets.dart';
import '../globals/globals.dart';
import '../models/user.dart';
import '../screens/page_login.dart';

class DialogLogout extends StatefulWidget {
  const DialogLogout({Key? key}) : super(key: key);

  @override
  State<DialogLogout> createState() => _DialogLogoutState();
}

class _DialogLogoutState extends State<DialogLogout> {
  @override
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        constraints: BoxConstraints(maxWidth: 350),
        decoration: dialogBgDeco(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 100,
                child:
                    Center(child: textS("정말 로그아웃 하시겠습니까?", text1Color, FontWeight.normal))),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    flex: 5,
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: lineColor, width: 2))),
                      child: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: textS("취소", text3Color, FontWeight.bold)),
                    )),
                Flexible(
                  flex: 5,
                  child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: mainColor, width: 2))),
                      child: TextButton(
                        onPressed: () {
                          clickProcess();
                        },
                        child: Text(
                          "로그아웃",
                          style: TextStyle(
                              color: mainColor, fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> clickProcess() async {
    print("clickProcess");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("login", false);
    // isLoggedIn = false;
    // userController.updateUser(User());
    Get.to(() => PageLogin());
  }
}

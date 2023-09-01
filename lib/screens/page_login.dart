import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meister2/dialogs/dialog_find_pw.dart';
import 'package:meister2/screens/page_join.dart';

import 'tab_main.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _moveJoin,
              child: Text('회원가입'),
            ),
            TextButton(
              onPressed: _findPw,
              child: Text('비밀번호 찾기'),
            ),
            TextButton(
              onPressed: _login,
              child: Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }

  void _moveJoin() {
    Get.to(PageJoin());
  }

  Future<void> _findPw() async {
    final response = await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return DialogFindPw(
        );
      },
    );
  }

  void _login() {
    Get.to(TabMain());
  }
}

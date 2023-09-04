import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meister2/dialogs/dialog_find_pw.dart';
import 'package:meister2/providers/user_provider.dart';
import 'package:meister2/screens/page_join.dart';

import '../models/user.dart';
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

  _login(){
    // getUser
    // Info("abcd1234");
    Get.to(TabMain());
  }

  // 커스텀 함수 생성
  Future<void> getUserInfo(String user_id) async {
    // Provider 생성
    UserProvider userProvider = UserProvider();
    // 서버에서 데이터를 받아오기를 기다렸다가 데이터가 넘어오면 response 아래 구문 수행
    final response = await userProvider.getUserInfo(user_id);
    if(response != null){
      // statusCode 가 200 이면 -> 정상적으로 결과값을 수신했으면
      if(response.statusCode == 200){
        // 결과값 을 가지고 후 처리
        print("response = ${response.body}");

        User user = User.fromJson(response.body);

        print("user : user_id = ${user.user_id}");
        print("user : nickname = ${user.nickname}");
      }
    }
  }

}

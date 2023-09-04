import 'package:flutter/material.dart';

import '../providers/user_provider.dart';

class TabPost extends StatefulWidget {
  const TabPost({Key? key}) : super(key: key);

  @override
  State<TabPost> createState() => _TabPostState();
}

class _TabPostState extends State<TabPost> {

  @override
  void initState() {
    super.initState();

    getUserInfo("abcd1234");
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('TabPost'));
  }
}

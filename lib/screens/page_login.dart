import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meister2/dialogs/dialog_find_pw.dart';
import 'package:meister2/providers/user_provider.dart';
import 'package:meister2/screens/page_join.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_options.dart';
import '../globals/custom_functions.dart';
import '../models/user.dart';
import 'tab_main.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {

  GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId: DefaultFirebaseOptions.currentPlatform.iosClientId
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 82, left: 54, right: 54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/logo_1.png",
                    width: 190,
                    height: 198,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            enabled: true,
                            style: TextStyle(fontSize: 14, color: Colors.black87),
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "아이디",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                              contentPadding: EdgeInsets.only(left: 30),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            enabled: true,
                            style: TextStyle(fontSize: 14, color: Colors.black87),
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "비밀번호",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                              contentPadding: EdgeInsets.only(left: 30),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // 컨텐츠 패딩을 설정
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end, // title을 오른쪽으로 정렬
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: Colors.amber,
                        ),
                        Text("자동 로그인", style: TextStyle(fontSize: 14.0)),
                        SizedBox(width: 8.0), // 아이콘과 텍스트 사이 간격
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => TabMain());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffEFAF13),
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(
                              fontSize: 15.0,
                            ),
                            fixedSize: Size(285.0, 46.0),
                          ),
                          child: Container(
                            // Container로 감싸서 가운데 정렬
                            alignment: Alignment.center,
                            child: Text(
                              '로그인',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                            child: Row (
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 14),
                                  ).copyWith(
                                    foregroundColor: MaterialStateColor.resolveWith(
                                          (Set<MaterialState> states) {
                                        return const Color(0xffEFAF13); // 원하는 색상으로 변경
                                      },
                                    ),
                                  ),
                                  onPressed: (){
                                    Get.to(() =>PageJoin());
                                  },
                                  child: const Text('회원가입'),
                                ),
                                SizedBox(width: 100),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 14),
                                    foregroundColor: const Color(0xffEFAF13),
                                  ),
                                  onPressed: null,
                                  child: const Text('비밀번호 찾기'),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 100),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            textStyle: TextStyle(
                              fontSize: 15.0,
                            ),
                            fixedSize: Size(285.0, 46.0),
                          ),
                          child: Container(
                            // Container로 감싸서 가운데 정렬
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/icons/google.png",
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 70), // 아이콘과 텍스트 사이의 간격 조절
                                Text('구글로그인'),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 15.0,
                              ),
                              fixedSize: Size(285.0, 46.0)),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/icons/apple.png",
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 70), // 아이콘과 텍스트 사이의 간격 조절
                                Text('애플로그인'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _googleSignout() => _googleSignIn.disconnect();

  Future<void> _googleSignin() async {
    final prefs = await SharedPreferences.getInstance();
    String fcm_token = await prefs.getString("fcm_token") ?? "no_fcm_token";
    try{
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if(googleUser !=null) {
        print("loginUserGoogle - googleUser != null");
        final String id = googleUser!.id.toString();
        final String nickname = googleUser!.displayName.toString();
        final String email = googleUser!.email.toString();
        final String profileImage = googleUser!.photoUrl.toString();

        print("google Signin id = ${id}");
        print("google Signin nickname = ${nickname}");
        print("google Signin email = ${email}");
        print("google Signin profileImage = ${profileImage}");

      }else{
        showSnackBar("login_failed".tr,"google_account_confirm".tr);
        return;
      }
    }catch(error) {
      print("loginUserGoogle error -${error.toString()}");
      showSnackBar("login_error".tr, error.toString());
    }
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meister2/globals/custom_colors.dart';
import 'package:meister2/globals/custom_widgets.dart';
import 'package:meister2/screens/detail_term.dart';

import 'package:flutter/material.dart';

class PageJoin extends StatefulWidget {
  const PageJoin({super.key});

  @override
  State<PageJoin> createState() => _PageJoinState();
}

class _PageJoinState extends State<PageJoin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 25,
              color: Colors.black45,
            ),
          ),
          title: Text("회원가입", style: TextStyle(fontSize: 15.0))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, left: 50, right: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/logo_1.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 30),
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
                              hintText: "이메일",
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
                        ClipOval(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "전송",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.amber,
                                padding: EdgeInsets.zero,
                                minimumSize: Size(40, 40)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
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
                              hintText: "인증번호",
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
                        TextButton(
                          onPressed: () {},
                          child: Text("확인",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.amber,
                              padding: EdgeInsets.zero,
                              minimumSize: Size(40, 40)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.visiblePassword,
                    enabled: true,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "비밀번호",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                      ),
                      contentPadding: EdgeInsets.only(left: 30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.black12)),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.visiblePassword,
                    enabled: true,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "비밀번호 확인",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                      ),
                      contentPadding: EdgeInsets.only(left: 30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.black12)),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    enabled: true,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "닉네임",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                      ),
                      contentPadding: EdgeInsets.only(left: 30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.black12)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 320,
              child: Divider(
                height: 0.1,
                color: Colors.black12,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "이용약관",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black12)),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.check_circle_rounded,
                      color: Colors.amber,
                    ),
                    title: Text("전체동의", style: TextStyle(fontSize: 14.0)),
                  ),
                  Divider(
                    height: 0.1,
                    color: Colors.black12,
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.check_circle_outline_rounded,
                          color: Colors.amber,
                        ),
                        title: Text("이용약관에 동의합니다.",
                            style: TextStyle(fontSize: 13.0)),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black54,
                        )),
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.check_circle_outline_rounded,
                          color: Colors.black12,
                        ),
                        title: Text("개인정보처리방침에 동의합니다.",
                            style: TextStyle(fontSize: 13.0)),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black54,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 280,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "회원가입",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.amber,
                ),
              ),
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}

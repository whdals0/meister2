import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../globals/custom_colors.dart';
import '../globals/custom_size.dart';
import '../globals/custom_widgets.dart';

class DialogFindPw extends StatefulWidget {
  const DialogFindPw({Key? key}) : super(key: key);

  @override
  State<DialogFindPw> createState() => _DialogFindPwState();
}

class _DialogFindPwState extends State<DialogFindPw> {
  TextEditingController _emailCt = TextEditingController();
  FocusNode _focusNodeEmail = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  setList();
  }

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
            SizedBox(height: 36),
            Text(
              "회원가입 시 사용한\n이메일 주소를 입력해주세요.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSizeM,
                  color: text1Color,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              decoration: inputRoundBox(),
              margin: EdgeInsets.only(top: 24, bottom: 16, left: 24, right: 24),
              padding: EdgeInsets.only(left: 16, right: 16),
              child: TextFormField(
                controller: _emailCt,
                focusNode: _focusNodeEmail,
                style: TextStyle(fontSize: fontSizeS),
                maxLength: 45,
                decoration: InputDecoration(
                    hintText: "이메일",
                    counterText: '',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[300], fontSize: fontSizeS)),
              ),
            ),
            Text(
              "이메일 주소로 전달된 링크를 클릭하시면\n임시 비밀번호가 발급됩니다.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: fontSizeXS, color: text4Color),
            ),
            SizedBox(
              height: 24,
            ),
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
                          // if(checkValid()){
                          //   InitPassword initPassword = InitPassword();
                          //   initPassword.email = _emailCt.text.trim();
                          //   initPassword.enabled = true;
                          //   initPassword.init_token = '';
                          //
                          //   Get.back(result: initPassword);
                          //
                          // }
                        },
                        child: Text(
                          "전송하기",
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
            // TextButton(
            //   onPressed: () {
            //     checkFormData();
            //   },
            //   child: Text(
            //     "초기화 링크 보내기",
            //     style: TextStyle(color: mainColor, fontWeight: FontWeight.bold),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

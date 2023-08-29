
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 이메일 유효성 검사 함수
bool validateEmail(String email) {
  // 정규식 패턴을 사용하여 이메일 유효성 검사
  // 해당 정규식 패턴은 간단한 이메일 유효성을 체크하는 예시입니다.
  // 더 강력한 정규식 패턴을 사용할 수도 있습니다.
  String pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,7}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(email);
}

// 게시글의 작성시간을 계산하고 리턴하는 함수
String calDate(String date) {
  String writeTime = "";
  DateTime date1 = DateTime.parse(date);
  DateTime date2 = DateTime.now();

  if (date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day) {
    //작성일이 오늘
    if (date2.difference(date1).inHours > 0) {
      writeTime = "${date2.difference(date1).inHours}" + "시간" + " 전";
      // writeTime = "${date2.difference(date1).inHours}시간 전";
    } else if (date2.difference(date1).inMinutes > 0) {
      writeTime =
          "${date2.difference(date1).inMinutes}" + " 분" + " 전";
      // writeTime = "${date2.difference(date1).inMinutes}분 전";
    } else {
      writeTime = " 방금";
    }
  } else {
    if (date2.difference(date1).inDays > 365) {
      writeTime = "${(date2.difference(date1).inDays / 365).toInt()}" +
          " 년" +
          " 전";
      // writeTime = "${(date2.difference(date1).inDays / 365).toInt()}년 전";
    } else if (date2.difference(date1).inDays > 30) {
      writeTime = "${(date2.difference(date1).inDays / 30).toInt()}" +
          " 달" +
          " 전";
      // writeTime = "${(date2.difference(date1).inDays / 30).toInt()}달 전";
    } else if (date2.difference(date1).inHours > 24) {
      writeTime =
          "${(date2.difference(date1).inDays).toInt()}" + " 일" + " 전";
      // writeTime = "${(date2.difference(date1).inDays).toInt()}일 전";
    } else {
      writeTime =
          "${(date2.difference(date1).inHours)}" + "시간" + " 전";
      // writeTime = "${(date2.difference(date1).inHours)}시간 전";
    }
  }
  return writeTime;
}

// 알림 창 띄우는 함수
void showSnackBar(String msg_title, String msg_body) {
  Get.snackbar(
      msg_title, // 제목
      msg_body, // 메시지
      duration: Duration(seconds: 1),
      // 메시지 노출 시간
      snackPosition: SnackPosition.BOTTOM,
      // 메시지 위치
      backgroundColor: Colors.white,
      colorText: Colors.black,
      margin: EdgeInsets.all(8.0),
      borderRadius: 16.0,
      barBlur: 4.0);
}
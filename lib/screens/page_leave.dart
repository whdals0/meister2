import 'package:flutter/material.dart';
import 'package:meister2/globals/custom_colors.dart';
import 'package:meister2/globals/custom_widgets.dart';

class PageLeave extends StatefulWidget {
  const PageLeave({Key? key}) : super(key: key);

  @override
  State<PageLeave> createState() => _PageLeaveState();
}

class _PageLeaveState extends State<PageLeave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: textM("회원탈퇴", text1Color, FontWeight.normal),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meister2/globals/custom_colors.dart';
import 'package:meister2/globals/custom_widgets.dart';
import 'package:meister2/screens/page_login.dart';

class PageSplash extends StatefulWidget {
  const PageSplash({Key? key}) : super(key: key);

  @override
  State<PageSplash> createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
        Get.to(PageLogin());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: textXXL('22 사이즈의 검정색 굵은 글자', text1Color, FontWeight.bold)
      ),
    );
  }
}
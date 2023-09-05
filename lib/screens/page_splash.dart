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
        child: textXXL('스플래쉬 이미지로 대체', text1Color, FontWeight.bold)
      ),
    );
  }
}

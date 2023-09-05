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
    return Container(
      color: const Color(0xffEFAF13),
      child: Center(
        child: Image.asset(
          "assets/icons/logo_white_1.png",
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

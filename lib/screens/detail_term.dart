import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../globals/custom_colors.dart';
import '../globals/custom_widgets.dart';

class DetailTerm extends StatefulWidget {
  const DetailTerm({Key? key}) : super(key: key);

  @override
  State<DetailTerm> createState() => _DetailTermState();
}

class _DetailTermState extends State<DetailTerm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: textM("이용약관", text1Color, FontWeight.normal),
      ),
      body: Container(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(16),
            width: Get.width,
            height: Get.height,
            color: Colors.white,
            child: Text("이용약관 내용 불러오기")),
      ),
    );
  }
}

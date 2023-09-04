import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meister2/globals/custom_colors.dart';
import 'package:meister2/globals/custom_widgets.dart';
import 'package:meister2/screens/detail_term.dart';

class PageJoin extends StatefulWidget {
  const PageJoin({Key? key}) : super(key: key);

  @override
  State<PageJoin> createState() => _PageJoinState();
}

class _PageJoinState extends State<PageJoin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: textM("회원가입", text1Color, FontWeight.normal),
      ),
      body: Container(
        color: Colors.white,
        child:Container(
          width: Get.width,
          height: Get.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _moveTerm,
                child: Text('약관보기'),
              ),
              TextButton(
                onPressed: _join,
                child: Text('회원가입'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _moveTerm(){
    Get.to(DetailTerm());
  }

  void _join(){
    Get.back();
  }
}

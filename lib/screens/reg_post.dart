import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../globals/custom_colors.dart';
import '../globals/custom_widgets.dart';

class RegPost extends StatefulWidget {
  const RegPost({Key? key}) : super(key: key);

  @override
  State<RegPost> createState() => _RegPostState();
}

class _RegPostState extends State<RegPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: textM("작성하기", text1Color, FontWeight.normal),
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
                onPressed: _regPost,
                child: Text('등록하기'),
              ),
              TextButton(
                onPressed: _addImage,
                child: Text('이미지 삽입'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _regPost(){
    Get.back();
  }
  void _addImage(){
    print("addImage");
  }
}

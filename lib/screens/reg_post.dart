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

  final TextEditingController _textEditingController = TextEditingController();
  // XFile? _image; // 선택한 이미지 저장 변수
  int _imageCount = 0;

  // Future<void> _getImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     _image = image;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 작성'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            //Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: SizedBox(
              height: 175,
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: '내용을 입력해주세요.',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft, // 왼쪽 아래로 정렬
            child: Padding(
              padding: EdgeInsets.only(left: 25.0), // 왼쪽 패딩 추가
              child: ElevatedButton(
                onPressed: () {
                  // _getImage();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[00],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(80, 80), // 너비와 높이를 동일하게 설정
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, size: 36, color: Colors.grey[500]),
                    SizedBox(height: 3),
                    Text('$_imageCount/5', style: TextStyle(fontSize: 18, color: Colors.grey[500])),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          // if (_image != null)
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Container(
          //         width: 80, // 이미지 버튼의 크기를 조절합니다.
          //         height: 80,
          //         child: Image.file(File(_image!.path), fit: BoxFit.cover),
          //       ),
          //     ],
          //   ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 300.0), // 아래쪽 패딩 추가
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 330, // 버튼의 폭을 조절합니다.
                    child: ElevatedButton(
                      onPressed: () {
                        // 등록하기 버튼이 눌렸을 때의 동작 추가
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[300], // 회색 배경 색상
                      ),
                      child: Text('등록하기', style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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

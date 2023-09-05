import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../globals/custom_colors.dart';
import '../globals/custom_functions.dart';
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

  // 이미지 파일의 경로 리스트
  List<String> file_path = [];

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
          Container(
            height: 80,
            width: Get.width,
            margin: EdgeInsets.only(top: 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                file_path.length == 5
                    ? SizedBox(
                        width: 0,
                        height: 0,
                      )
                    : Container(
                        height: 80,
                        margin: EdgeInsets.only(right: 16),
                        child: ElevatedButton(
                            onPressed: () {
                              getPhoto();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: mainGray,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                padding: EdgeInsets.only(
                                    top: 16, bottom: 16, right: 28, left: 28)),
                            child: Column(
                              children: [
                                Icon(Icons.camera_alt),
                                Text(
                                  "${file_path.length}/5",
                                  style: TextStyle(color: text4Color),
                                )
                              ],
                            )),
                      ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: file_path.length,
                    itemBuilder: (BuildContext contexts, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child: Stack(
                          children: [
                            ImageItem(file_path[index]),
                            Positioned(
                              right: 2,
                              top: 2,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      file_path.removeAt(index);
                                    });
                                  },
                                  constraints: BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                  icon: Icon(Icons.delete_outline, color: Colors.white,)),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
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
                      child: Text('등록하기',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600])),
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

  Widget ImageItem(String filepath) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: text5Color),
          borderRadius: BorderRadius.circular(8)),
      height: 80,
      width: 80,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Image.network(
          filepath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> getPhoto() async {
    if (Theme.of(context).platform == TargetPlatform.android ||
        Theme.of(context).platform == TargetPlatform.iOS) {
      final hasFilePermission = await requestFilePermission();
      switch (hasFilePermission) {
        case "granted":
          final response = await pickMobileContent("image");
          if (response != null) {
            if (response['result'] == "success") {
              setState(() {
                file_path.insert(0, response['body']);
              });
            } else {
              showSnackBar(response['title'], response['body']);
            }
          }
          break;
        case "isPermanentlyDenied":
          var result = await showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('권한 요청'),
              content: const Text('앨범 접근 권한이 필요합니다. \n이동하시겠습니까?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'cancel'),
                  child: const Text('취소'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'ok'),
                  child: const Text('이동하기'),
                ),
              ],
            ),
          );
          if (result == 'ok') {
            openAppSettings();
          }
          break;
        case "denied":
          var result = await showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('권한 요청'),
              content: const Text('앨범 접근 권한이 필요합니다. \n이동하시겠습니까?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'cancel'),
                  child: const Text('취소'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'ok'),
                  child: const Text('이동하기'),
                ),
              ],
            ),
          );
          if (result == 'ok') {
            openAppSettings();
          }
          break;
      }
    } else {
      print("not supported this platform.");
    }
  }

  void _regPost() {
    Get.back();
  }

  void _addImage() {
    print("addImage");
  }
}

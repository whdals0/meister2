
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meister2/providers/media_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../dialogs/dialog_image.dart';
import '../models/media.dart';

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

// BottomSheet 불러오기
void btmSheet(Widget content, context, double padding) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            content,
          ],
        ),
      );
    },
  );
}

String daySplitShort(String date) {
  // print("date ${date}");
  if (date == null || date == "") {
    return "";
  }
  String return_day = date.substring(2, 4) +
      "-" +
      date.substring(5, 7) +
      "-" +
      date.substring(8, 10);
  return return_day;
}

// 이미지 보여주기 팝업
void ShowImage(String filepath) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return DialogImage(imgpath: filepath.trim());
    },
  );
}

Future<String> requestFilePermission() async {
  PermissionStatus result;
  // In Android we need to request the storage permission,
  // while in iOS is the photos permission
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  if (Platform.isAndroid) {
    _deviceData = _readAndroidBuildData(await DeviceInfoPlugin().androidInfo);

    var sdkInt = _deviceData['version.sdkInt'];
    print('Android info ${sdkInt}');

    if (sdkInt >= 33) {
      print("33>=");
      result = await Permission.photos.request();
    } else {
      print("33<");
      result = await Permission.storage.request();
    }
  } else {
    _deviceData = _readIosDeviceInfo(await DeviceInfoPlugin().iosInfo);
    print('iOS info ${_deviceData['systemVersion']}');

    result = await Permission.photos.request();
  }

  if (result.isGranted) {
    return "granted";
  } else if (result.isPermanentlyDenied) {
    return "isPermanentlyDenied";
  } else {
    return "denied";
  }
}

Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  return <String, dynamic>{
    'version.securityPatch': build.version.securityPatch,
    'version.sdkInt': build.version.sdkInt,
    'version.release': build.version.release,
    'version.previewSdkInt': build.version.previewSdkInt,
    'version.incremental': build.version.incremental,
    'version.codename': build.version.codename,
    'version.baseOS': build.version.baseOS,
    'board': build.board,
    'bootloader': build.bootloader,
    'brand': build.brand,
    'device': build.device,
    'display': build.display,
    'fingerprint': build.fingerprint,
    'hardware': build.hardware,
    'host': build.host,
    'id': build.id,
    'manufacturer': build.manufacturer,
    'model': build.model,
    'product': build.product,
    'supported32BitAbis': build.supported32BitAbis,
    'supported64BitAbis': build.supported64BitAbis,
    'supportedAbis': build.supportedAbis,
    'tags': build.tags,
    'type': build.type,
    'isPhysicalDevice': build.isPhysicalDevice,
    'systemFeatures': build.systemFeatures,
    'displaySizeInches':
    ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
    'displayWidthPixels': build.displayMetrics.widthPx,
    'displayWidthInches': build.displayMetrics.widthInches,
    'displayHeightPixels': build.displayMetrics.heightPx,
    'displayHeightInches': build.displayMetrics.heightInches,
    'displayXDpi': build.displayMetrics.xDpi,
    'displayYDpi': build.displayMetrics.yDpi,
    'serialNumber': build.serialNumber,
  };
}

Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  return <String, dynamic>{
    'name': data.name,
    'systemName': data.systemName,
    'systemVersion': data.systemVersion,
    'model': data.model,
    'localizedModel': data.localizedModel,
    'identifierForVendor': data.identifierForVendor,
    'isPhysicalDevice': data.isPhysicalDevice,
    'utsname.sysname:': data.utsname.sysname,
    'utsname.nodename:': data.utsname.nodename,
    'utsname.release:': data.utsname.release,
    'utsname.version:': data.utsname.version,
    'utsname.machine:': data.utsname.machine,
  };
}


// 기기의 파일 가져오기, 이미지, 동영상
Future<Map<String, dynamic>> pickMobileContent(String category) async {
  FilePickerResult? picked = null;
  final _fileName;
  final _fileSize;

  try {
    picked = await FilePicker.platform.pickFiles(
      // 카테고리에 맞는 파일 가져오기
      type: Platform.isIOS ? forIosFileType(category) : FileType.custom,
      allowedExtensions: Platform.isIOS ? null : allowExtensions(category),
      withData: false,
    );
  } catch (error) {
    return {
      "result": "error",
      "title": "failure".tr, //오류 시 아래 원본으로
      "body": "failure_content".tr
    };
  }

  if (picked != null) {
    print("picked != null");
    _fileName = picked.files.single.name;
    _fileSize = (picked.files.single.size / (1024 * 1024)).toStringAsFixed(2);

    if (double.parse(_fileSize) > 20) {
      // 20MB 용량 체크
      // showSnackBar("exceeded".tr, "under_20mb".tr);
      return {
        "result": "error",
        "title": "exceeded".tr,
        "body": "under_20mb".tr
      };
    } else {
      final response;
      var filepath = "";

      response =
      await MediaProvider().uploadFile(picked.files.single.path!, _fileName);
      print("now = ${DateTime.now()} . ${response.body}");
      filepath = Media.fromJson(response.body).filepath!;

      return {
        "result": "success",
        "title": "success_upload_file".tr,
        "body": filepath
      };
    }
  } else {
    // showSnackBar("unsupported".tr, "unsupported_content".tr);
    return {
      "result": "cancel",
      "title": "unsupported".tr,
      "body": "unsupported_content".tr
    };
  }
}


List<String> allowExtensions(String category) {
  if (category == 'video') {
    return ['mp4'];
  } else if (category == 'image') {
    return ['jpeg', 'gif', 'png'];
  } else if (category == 'audio') {
    return ['mp3'];
  } else {
    return ['jpg', 'jpeg', 'gif', 'png'];
  }
}

FileType forIosFileType(String category) {
  if (category == 'video') {
    return FileType.video;
  } else if (category == 'image') {
    return FileType.image;
  } else if (category == 'audio') {
    return FileType.audio;
  } else {
    return FileType.media;
  }
}
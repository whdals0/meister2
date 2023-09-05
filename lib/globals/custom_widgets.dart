import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'custom_colors.dart';
import 'custom_size.dart';

Widget textXXL(String? title, Color color, FontWeight fontWeight,
    {TextAlign? textAlign}) {
  if (title == null || title == '') {
    title = "";
  }
  if (textAlign == null) {
    textAlign = TextAlign.start;
  }
  return Text(title,
      style: TextStyle(
        color: color,
        fontSize: fontSizeXXL,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign);
}

Widget textXL(String? title, Color color, FontWeight fontWeight,
    {TextAlign? textAlign}) {
  if (title == null || title == '') {
    title = "";
  }
  if (textAlign == null) {
    textAlign = TextAlign.start;
  }
  return Text(title,
      style: TextStyle(
        color: color,
        fontSize: fontSizeXL,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign);
}

Widget textL(String? title, Color color, FontWeight fontWeight,
    {TextAlign? textAlign}) {
  if (title == null || title == '') {
    title = "";
  }
  if (textAlign == null) {
    textAlign = TextAlign.start;
  }
  return Text(title,
      style: TextStyle(
        color: color,
        fontSize: fontSizeL,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign);
}

Widget textM(String? title, Color color, FontWeight fontWeight,
    {TextAlign? textAlign}) {
  if (title == null || title == '') {
    title = "";
  }
  if (textAlign == null) {
    textAlign = TextAlign.start;
  }
  return Text(title,
      style: TextStyle(
        color: color,
        fontSize: fontSizeM,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign);
}

Widget textS(String? title, Color color, FontWeight fontWeight,
    {TextAlign? textAlign}) {
  if (title == null || title == '') {
    title = "";
  }
  if (textAlign == null) {
    textAlign = TextAlign.start;
  }
  return Text(title,
      style: TextStyle(
        color: color,
        fontSize: fontSizeS,
        fontWeight: fontWeight,
      ));
}

Widget textXS(String? title, Color color, FontWeight fontWeight,
    {TextAlign? textAlign}) {
  if (title == null || title == '') {
    title = "";
  }
  if (textAlign == null) {
    textAlign = TextAlign.start;
  }
  return Text(title,
    style: TextStyle(
      color: color,
      fontSize: fontSizeXS,
      fontWeight: fontWeight,
    ),
    textAlign: textAlign,);
}

Widget textXXS(String? title, Color color, FontWeight fontWeight,
    {TextAlign? textAlign}) {
  if (title == null || title == '') {
    title = "";
  }
  if (textAlign == null) {
    textAlign = TextAlign.start;
  }
  return Text(title,
      style: TextStyle(
        color: color,
        fontSize: fontSizeXXS,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign);
}

Widget textXXXS(String? title, Color color, FontWeight fontWeight,
    {TextAlign? textAlign}) {
  if (title == null || title == '') {
    title = "";
  }
  if (textAlign == null) {
    textAlign = TextAlign.start;
  }
  return Text(title,
      style: TextStyle(
        color: color,
        fontSize: fontSizeXXXS,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign);
}


BoxDecoration dialogBgDeco() {
  return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30)), color: Colors.white);
}


BoxDecoration inputRoundBox() {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(60)),
    border: Border.all(color: lineColor),
  );
}


Widget loadUserProfile(String? filepath, double imgSize) {
  if (filepath == null || filepath == '') {
    return SvgPicture.asset(
      "assets/icons/default_profile.svg",
      width: imgSize,
      height: imgSize,
      fit: BoxFit.contain,
      color: Colors.grey,
    );
  } else {
    return CircleAvatar(
      radius: imgSize / 2, // 동그라미 크기 조정
      backgroundColor: Colors.transparent, // 배경색 설정 (투명으로)
      child: ClipOval(
        child: Image.network(
          filepath!, // 이미지 URL
          fit: BoxFit.cover, // 이미지를 꽉 차게 표시
          height: imgSize, width: imgSize,
        ),
      ),
    );
  }
}


Widget contentLabelMax2Line(String? txt) {
  if (txt == null || txt == '') {
    txt = "";
  }

  return Text(
    txt,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(color: text3Color, fontSize: fontSizeS),
  );
}

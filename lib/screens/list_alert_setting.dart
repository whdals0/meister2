import 'package:flutter/material.dart';
import 'package:meister2/globals/custom_colors.dart';
import 'package:meister2/providers/user_alert_provider.dart';

import '../globals/custom_functions.dart';
import '../globals/custom_widgets.dart';
import '../models/user_alert.dart';

class ListAlertSetting extends StatefulWidget {
  const ListAlertSetting({Key? key}) : super(key: key);

  @override
  State<ListAlertSetting> createState() => _ListAlertSettingState();
}

class _ListAlertSettingState extends State<ListAlertSetting> {

  bool notice_yn = true;
  bool comm_yn = true;

  UserAlert alerts = UserAlert();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    _getAlertSetting();
  }

  Future<void> _getAlertSetting() async {
    print("getAlertSetting");
    final response = await UserAlertProvider().getDetail("Pv33SNy9QG");
    if (response.statusCode == 200) {
      if (response.body != null) {
        alerts = UserAlert.fromJson(response.body);
        print(alerts.toJson());

        notice_yn = alerts.notice_yn! == 1 ? true : false;
        comm_yn = alerts.comm_yn! == 1 ? true : false;
        setState(() {});
      } else {
        showSnackBar("데이터 없음", "해당 데이터가 없습니다");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: textM("알림 설정", text1Color, FontWeight.normal),
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            ListTile(
              title: textS("공지 & 이벤트 안내", text3Color, FontWeight.normal),
              trailing: Container(
                width: 60,
                child: Switch(
                  value: notice_yn,
                  onChanged: (value) async {
                    print("notice_yn ");
                    alerts.notice_yn = value ? 1 : 0;
                    final response = await UserAlertProvider()
                        .updateContent(alerts.id!, alerts.toEdit());
                    if (response.statusCode == 200) {
                      setState(() {
                        notice_yn = value;
                      });
                    }
                  },
                  activeColor: mainColor,
                  activeTrackColor: Color(0xFFF0F0F0),
                  inactiveThumbColor: Color(0xFFBDC1BE),
                  inactiveTrackColor: Color(0xFFF0F0F0),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ListTile(
                title: textS("커뮤니티 알림", text3Color, FontWeight.normal),
                trailing: Container(
                  width: 60,
                  child: Switch(
                    value: comm_yn,
                    onChanged: (value) async {
                      alerts.comm_yn = value ? 1 : 0;
                      final response = await UserAlertProvider()
                          .updateContent(alerts.id!, alerts.toEdit());
                      if (response.statusCode == 200) {
                        setState(() {
                          comm_yn = value;
                        });
                      }
                    },
                    activeColor: mainColor,
                    activeTrackColor: Color(0xFFF0F0F0),
                    inactiveThumbColor: Color(0xFFBDC1BE),
                    inactiveTrackColor: Color(0xFFF0F0F0),
                  ),
                )),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

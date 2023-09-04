import 'package:json_annotation/json_annotation.dart';

part 'user_alert.g.dart';

@JsonSerializable()
class UserAlert {
  int id;
  String user_id;
  int notice_yn = 1;
  int comm_yn = 1;
  String created_at;
  String updated_at;

  UserAlert(
      {required this.id,
        required this.user_id,
        required this.notice_yn,
        required this.comm_yn,
        required this.created_at,
        required this.updated_at});

  factory UserAlert.fromJson(Map<String, dynamic> json) => _$UserAlertFromJson(json);

  Map<String, dynamic> toJson() => _$UserAlertToJson(this);
}

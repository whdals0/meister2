import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String user_id;
  String auth_type;
  String auth_id;
  String email;
  String passwd;
  String nickname;
  String fcm_token;
  String? auth_token;
  String status;
  String filepath;
  String created_at;
  String updated_at;

  User(
      {required this.id,
      required this.user_id,
      required this.auth_type,
      required this.auth_id,
      required this.email,
      required this.passwd,
      required this.nickname,
      required this.fcm_token,
      this.auth_token,
      required this.status,
      required this.filepath,
      required this.created_at,
      required this.updated_at});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

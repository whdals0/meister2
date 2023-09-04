import 'package:json_annotation/json_annotation.dart';

part 'init_passwd.g.dart';

@JsonSerializable()
class InitPasswd {
  int id;
  String email;
  String? init_token;
  int enabled = 1;
  String? init_at = "";
  String created_at;
  String updated_at;

  InitPasswd(
      {required this.id,
      required this.email,
      this.init_token,
      required this.enabled,
      this.init_at,
      required this.created_at,
      required this.updated_at});

  factory InitPasswd.fromJson(Map<String, dynamic> json) =>
      _$InitPasswdFromJson(json);

  Map<String, dynamic> toJson() => _$InitPasswdToJson(this);
}

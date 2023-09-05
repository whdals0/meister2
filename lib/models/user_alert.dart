import 'package:json_annotation/json_annotation.dart';

part 'user_alert.g.dart';

@JsonSerializable()
class UserAlert {
  int? id;
  String? user_id;
  int? notice_yn = 1;
  int? comm_yn = 1;
  String? created_at;
  String? updated_at;

  UserAlert(
      { this.id,
        this.user_id,
        this.notice_yn,
        this.comm_yn,
        this.created_at,
        this.updated_at});

  factory UserAlert.fromJson(Map<String, dynamic> json) => _$UserAlertFromJson(json);

  Map<String, dynamic> toJson() => _$UserAlertToJson(this);
  Map<String, dynamic> toEdit() => _$UserAlertToEdit(this);
}

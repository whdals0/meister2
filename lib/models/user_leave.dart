import 'package:json_annotation/json_annotation.dart';

part 'user_leave.g.dart';

@JsonSerializable()
class UserLeave {
  int id;
  String user_id;
  String content;
  String status;
  String? process_at = "";
  String created_at;
  String updated_at;

  UserLeave(
      {required this.id,
        required this.user_id,
        required this.content,
        required this.status,
        this.process_at,
        required this.created_at,
        required this.updated_at});

  factory UserLeave.fromJson(Map<String, dynamic> json) => _$UserLeaveFromJson(json);

  Map<String, dynamic> toJson() => _$UserLeaveToJson(this);
}

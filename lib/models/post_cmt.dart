import 'package:json_annotation/json_annotation.dart';

part 'post_cmt.g.dart';

@JsonSerializable()
class PostCmt {
  int id;
  int post_id;
  String user_id;
  String content;
  int blocked = 0;
  String? blocked_at = "";
  String created_at;
  String updated_at;

  PostCmt(
      {required this.id,
        required this.post_id,
        required this.user_id,
        required this.content,
        required this.blocked,
        this.blocked_at,
        required this.created_at,
        required this.updated_at});

  factory PostCmt.fromJson(Map<String, dynamic> json) => _$PostCmtFromJson(json);

  Map<String, dynamic> toJson() => _$PostCmtToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'post_cmt.g.dart';

@JsonSerializable()
class PostCmt {
  int? id;
  int? post_id;
  String? user_id;
  String? user_filepath;
  String? user_nickname;
  String? content;
  int? like_cnt;
  int? like_it;
  int? like_id;
  int? blocked = 0;
  String? blocked_at = "";
  String? created_at;
  String? updated_at;

  PostCmt(
      {this.id,
      this.post_id,
      this.user_id,
      this.user_filepath,
      this.user_nickname,
      this.content,
      this.like_cnt,
      this.like_it,
      this.like_id,
      this.blocked,
      this.blocked_at,
      this.created_at,
      this.updated_at});

  factory PostCmt.fromJson(Map<String, dynamic> json) =>
      _$PostCmtFromJson(json);

  Map<String, dynamic> toJson() => _$PostCmtToJson(this);
  Map<String, dynamic> toReg() => _$PostCmtToReg(this);
}

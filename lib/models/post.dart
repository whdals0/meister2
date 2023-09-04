import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  int id;
  String user_id;
  String? user_filepath;
  String? user_nickname;
  String content;
  String? top_category;
  String? filetype;
  String? filepath;
  int? view_cnt;
  int? cmt_cnt;
  int? like_cnt;
  int? like_it;
  int? like_id;
  int blocked = 0;
  String? blocked_at = "";
  String created_at;
  String updated_at;

  Post(
      {required this.id,
      required this.user_id,
      this.user_filepath,
      this.user_nickname,
      required this.content,
      this.top_category,
      this.filetype,
      this.filepath,
      required this.blocked,
      required this.blocked_at,
      required this.view_cnt,
      required this.cmt_cnt,
      required this.like_cnt,
      required this.like_it,
      required this.like_id,
      required this.created_at,
      required this.updated_at});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

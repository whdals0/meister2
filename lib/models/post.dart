import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  int? id;
  String? user_id;
  String? user_filepath;
  String? user_nickname;
  String? content;
  String? top_category;
  String? filetype;
  String? filepath;
  int? view_cnt;
  int? cmt_cnt;
  int? like_cnt;
  int? like_it;
  int? like_id;
  int? blocked = 0;
  String? blocked_at = "";
  String? created_at;
  String? updated_at;

  Post(
      {this.id,
      this.user_id,
      this.user_filepath,
      this.user_nickname,
      this.content,
      this.top_category,
      this.filetype,
      this.filepath,
      this.blocked,
      this.blocked_at,
      this.view_cnt,
      this.cmt_cnt,
      this.like_cnt,
      this.like_it,
      this.like_id,
      this.created_at,
      this.updated_at});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

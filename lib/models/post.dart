import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  int id;
  String user_id;
  String content;
  String? top_category;
  String? filepath;
  int blocked = 0;
  String blocked_at = "";
  int view_cnt = 0;
  String created_at;
  String updated_at;

  Post(
      {required this.id,
      required this.user_id,
      required this.content,
      this.top_category,
      this.filepath,
      required this.blocked,
      required this.blocked_at,
      required this.view_cnt,
      required this.created_at,
      required this.updated_at});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

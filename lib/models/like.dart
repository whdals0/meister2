import 'package:json_annotation/json_annotation.dart';

part 'like.g.dart';

@JsonSerializable()
class Like {
  int id;
  String user_id;
  String top_category;
  String? category_id;
  String created_at;
  String updated_at;

  Like(
      {required this.id,
      required this.user_id,
      required this.top_category,
      this.category_id,
      required this.created_at,
      required this.updated_at});

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);

  Map<String, dynamic> toJson() => _$LikeToJson(this);
}

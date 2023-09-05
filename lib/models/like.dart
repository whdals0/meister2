import 'package:json_annotation/json_annotation.dart';

part 'like.g.dart';

@JsonSerializable()
class Like {
  int? id;
  String? user_id;
  String? top_category;
  String? category_id;
  String? created_at;
  String? updated_at;

  Like(
      {this.id,
      this.user_id,
      this.top_category,
      this.category_id,
      this.created_at,
      this.updated_at});

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);

  Map<String, dynamic> toJson() => _$LikeToJson(this);
}

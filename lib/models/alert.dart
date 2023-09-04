import 'package:json_annotation/json_annotation.dart';

part 'alert.g.dart';

@JsonSerializable()
class Alert {
  int id;
  String user_id;
  String title;
  String? top_category;
  String? category_id;
  String? view_at;
  String created_at;
  String updated_at;

  Alert(
      {required this.id,
      required this.user_id,
      required this.title,
      this.top_category,
      this.category_id,
      this.view_at,
      required this.created_at,
      required this.updated_at});

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

  Map<String, dynamic> toJson() => _$AlertToJson(this);
}

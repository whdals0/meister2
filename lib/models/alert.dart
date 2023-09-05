import 'package:json_annotation/json_annotation.dart';

part 'alert.g.dart';

@JsonSerializable()
class Alert {
  int? id;
  String? user_id;
  String? title;
  String? top_category;
  String? category_id;
  String? view_at;
  String? created_at;
  String? updated_at;

  Alert(
      { this.id,
      this.user_id,
      this.title,
      this.top_category,
      this.category_id,
      this.view_at,
      this.created_at,
      this.updated_at});

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

  Map<String, dynamic> toJson() => _$AlertToJson(this);
  Map<String, dynamic> toReg() => _$AlertToReg(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable()
class Report {
  int id;
  String user_id;
  String top_category;
  String category_id;
  String status;
  String? process_at;
  String? memo;
  String created_at;
  String updated_at;

  Report(
      {required this.id,
        required this.user_id,
        required this.top_category,
        required this.category_id,
        required this.status,
        this.process_at,
        this.memo,
        required this.created_at,
        required this.updated_at});

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

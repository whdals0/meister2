import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable()
class Report {
  int? id;
  String? user_id;
  String? top_category;
  String? category_id;
  String? status;
  String? process_at;
  String? memo;
  String? created_at;
  String? updated_at;

  Report(
      { this.id,
        this.user_id,
        this.top_category,
        this.category_id,
        this.status,
        this.process_at,
        this.memo,
        this.created_at,
        this.updated_at});

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'paginate.g.dart';

@JsonSerializable()
class Paginate {
  int? current_page;
  List<dynamic>? data;
  String? first_page_url;
  int? from;
  int? last_page;
  String? last_page_url;
  List<dynamic>? links;
  String? next_page_url;
  String? path;
  int? per_page;
  String? prev_page_url;
  int? to;
  int? total;


  Paginate(
      this.current_page,
      this.data,
      this.first_page_url,
      this.from,
      this.last_page,
      this.last_page_url,
      this.links,
      this.next_page_url,
      this.path,
      this.per_page,
      this.prev_page_url,
      this.to,
      this.total);

  factory Paginate.fromJson(Map<String, dynamic> json) => _$PaginateFromJson(json);

  Map<String, dynamic> toJson() => _$PaginateToJson(this);
}

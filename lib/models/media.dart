import 'package:json_annotation/json_annotation.dart';

part 'media.g.dart';

@JsonSerializable()
class Media {
  int? id;
  String? title;
  String? filetype;
  String? filepath;
  String? created_at;
  String? updated_at;

  Media(
      {this.id,
      this.title,
      this.filetype,
      this.filepath,
      this.created_at,
      this.updated_at});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

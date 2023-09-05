// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      id: json['id'] as int?,
      title: json['title'] as String?,
      filetype: json['filetype'] as String?,
      filepath: json['filepath'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'filetype': instance.filetype,
      'filepath': instance.filepath,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

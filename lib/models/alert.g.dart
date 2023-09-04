// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alert _$AlertFromJson(Map<String, dynamic> json) => Alert(
      id: json['id'] as int,
      user_id: json['user_id'] as String,
      title: json['title'] as String,
      top_category: json['top_category'] as String?,
      category_id: json['category_id'] as String?,
      view_at: json['view_at'] as String?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'title': instance.title,
      'top_category': instance.top_category,
      'category_id': instance.category_id,
      'view_at': instance.view_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

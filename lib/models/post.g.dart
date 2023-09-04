// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int,
      user_id: json['user_id'] as String,
      content: json['content'] as String,
      top_category: json['top_category'] as String?,
      filepath: json['filepath'] as String?,
      blocked: json['blocked'] as int,
      blocked_at: json['blocked_at'] as String,
      view_cnt: json['view_cnt'] as int,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'content': instance.content,
      'top_category': instance.top_category,
      'filepath': instance.filepath,
      'blocked': instance.blocked,
      'blocked_at': instance.blocked_at,
      'view_cnt': instance.view_cnt,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

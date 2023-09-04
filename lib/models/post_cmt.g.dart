// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_cmt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCmt _$PostCmtFromJson(Map<String, dynamic> json) => PostCmt(
      id: json['id'] as int,
      post_id: json['post_id'] as int,
      user_id: json['user_id'] as String,
      content: json['content'] as String,
      blocked: json['blocked'] as int,
      blocked_at: json['blocked_at'] as String?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$PostCmtToJson(PostCmt instance) => <String, dynamic>{
      'id': instance.id,
      'post_id': instance.post_id,
      'user_id': instance.user_id,
      'content': instance.content,
      'blocked': instance.blocked,
      'blocked_at': instance.blocked_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

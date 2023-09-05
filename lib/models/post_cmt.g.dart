// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_cmt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCmt _$PostCmtFromJson(Map<String, dynamic> json) => PostCmt(
      id: json['id'] as int?,
      post_id: json['post_id'] as int?,
      user_id: json['user_id'] as String?,
      user_filepath: json['user_filepath'] as String?,
      user_nickname: json['user_nickname'] as String?,
      content: json['content'] as String?,
      like_cnt: json['like_cnt'] as int?,
      like_it: json['like_it'] as int?,
      like_id: json['like_id'] as int?,
      blocked: json['blocked'] as int?,
      blocked_at: json['blocked_at'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PostCmtToJson(PostCmt instance) => <String, dynamic>{
      'id': instance.id,
      'post_id': instance.post_id,
      'user_id': instance.user_id,
      'user_filepath': instance.user_filepath,
      'user_nickname': instance.user_nickname,
      'content': instance.content,
      'like_cnt': instance.like_cnt,
      'like_it': instance.like_it,
      'like_id': instance.like_id,
      'blocked': instance.blocked,
      'blocked_at': instance.blocked_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

Map<String, dynamic> _$PostCmtToReg(PostCmt instance) => <String, dynamic>{
      'post_id': instance.post_id,
      'user_id': instance.user_id,
      'content': instance.content,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
      user_filepath: json['user_filepath'] as String?,
      user_nickname: json['user_nickname'] as String?,
      content: json['content'] as String?,
      top_category: json['top_category'] as String?,
      filetype: json['filetype'] as String?,
      filepath: json['filepath'] as String?,
      blocked: json['blocked'] as int?,
      blocked_at: json['blocked_at'] as String?,
      view_cnt: json['view_cnt'] as int?,
      cmt_cnt: json['cmt_cnt'] as int?,
      like_cnt: json['like_cnt'] as int?,
      like_it: json['like_it'] as int?,
      like_id: json['like_id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'user_filepath': instance.user_filepath,
      'user_nickname': instance.user_nickname,
      'content': instance.content,
      'top_category': instance.top_category,
      'filetype': instance.filetype,
      'filepath': instance.filepath,
      'view_cnt': instance.view_cnt,
      'cmt_cnt': instance.cmt_cnt,
      'like_cnt': instance.like_cnt,
      'like_it': instance.like_it,
      'like_id': instance.like_id,
      'blocked': instance.blocked,
      'blocked_at': instance.blocked_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };


Map<String, dynamic> _$PostToReg(Post instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'content': instance.content,
      'top_category': instance.top_category,
      'filepath': instance.filepath,
      'blocked': instance.blocked,
};

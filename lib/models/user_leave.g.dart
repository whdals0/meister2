// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLeave _$UserLeaveFromJson(Map<String, dynamic> json) => UserLeave(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
      content: json['content'] as String?,
      status: json['status'] as String,
      process_at: json['process_at'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserLeaveToJson(UserLeave instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'content': instance.content,
      'status': instance.status,
      'process_at': instance.process_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

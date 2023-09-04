// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      user_id: json['user_id'] as String,
      auth_type: json['auth_type'] as String,
      auth_id: json['auth_id'] as String,
      email: json['email'] as String,
      passwd: json['passwd'] as String,
      nickname: json['nickname'] as String,
      fcm_token: json['fcm_token'] as String,
      auth_token: json['auth_token'] as String?,
      status: json['status'] as String,
      filepath: json['filepath'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'auth_type': instance.auth_type,
      'auth_id': instance.auth_id,
      'email': instance.email,
      'passwd': instance.passwd,
      'nickname': instance.nickname,
      'fcm_token': instance.fcm_token,
      'auth_token': instance.auth_token,
      'status': instance.status,
      'filepath': instance.filepath,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

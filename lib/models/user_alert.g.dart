// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAlert _$UserAlertFromJson(Map<String, dynamic> json) => UserAlert(
      id: json['id'] as int,
      user_id: json['user_id'] as String,
      notice_yn: json['notice_yn'] as int,
      comm_yn: json['comm_yn'] as int,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$UserAlertToJson(UserAlert instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'notice_yn': instance.notice_yn,
      'comm_yn': instance.comm_yn,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_passwd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitPasswd _$InitPasswdFromJson(Map<String, dynamic> json) => InitPasswd(
      id: json['id'] as int?,
      email: json['email'] as String?,
      init_token: json['init_token'] as String?,
      enabled: json['enabled'] as int?,
      init_at: json['init_at'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$InitPasswdToJson(InitPasswd instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'init_token': instance.init_token,
      'enabled': instance.enabled,
      'init_at': instance.init_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

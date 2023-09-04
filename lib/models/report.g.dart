// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      id: json['id'] as int,
      user_id: json['user_id'] as String,
      top_category: json['top_category'] as String,
      category_id: json['category_id'] as String,
      status: json['status'] as String,
      process_at: json['process_at'] as String?,
      memo: json['memo'] as String?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'top_category': instance.top_category,
      'category_id': instance.category_id,
      'status': instance.status,
      'process_at': instance.process_at,
      'memo': instance.memo,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

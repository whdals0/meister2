// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Like _$LikeFromJson(Map<String, dynamic> json) => Like(
      id: json['id'] as int,
      user_id: json['user_id'] as String,
      top_category: json['top_category'] as String,
      category_id: json['category_id'] as String?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$LikeToJson(Like instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'top_category': instance.top_category,
      'category_id': instance.category_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paginate _$PaginateFromJson(Map<String, dynamic> json) => Paginate(
      json['current_page'] as int?,
      json['data'] as List<dynamic>?,
      json['first_page_url'] as String?,
      json['from'] as int?,
      json['last_page'] as int?,
      json['last_page_url'] as String?,
      json['links'] as List<dynamic>?,
      json['next_page_url'] as String?,
      json['path'] as String?,
      json['per_page'] as int?,
      json['prev_page_url'] as String?,
      json['to'] as int?,
      json['total'] as int?,
    );

Map<String, dynamic> _$PaginateToJson(Paginate instance) => <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
      'first_page_url': instance.first_page_url,
      'from': instance.from,
      'last_page': instance.last_page,
      'last_page_url': instance.last_page_url,
      'links': instance.links,
      'next_page_url': instance.next_page_url,
      'path': instance.path,
      'per_page': instance.per_page,
      'prev_page_url': instance.prev_page_url,
      'to': instance.to,
      'total': instance.total,
    };

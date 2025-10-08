// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourcesResponse _$SourcesResponseFromJson(Map<String, dynamic> json) =>
    SourcesResponse(
      status: json['status'] as String?,
      sources:
          (json['sources'] as List<dynamic>?)
              ?.map((e) => Sources.fromJson(e as Map<String, dynamic>))
              .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SourcesResponseToJson(SourcesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'sources': instance.sources,
    };

Sources _$SourcesFromJson(Map<String, dynamic> json) => Sources(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  url: json['url'] as String?,
  category: json['category'] as String?,
  language: json['language'] as String?,
  country: json['country'] as String?,
);

Map<String, dynamic> _$SourcesToJson(Sources instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'url': instance.url,
  'category': instance.category,
  'language': instance.language,
  'country': instance.country,
};

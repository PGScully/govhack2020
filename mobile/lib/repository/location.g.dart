// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    id: json['id'] as int,
    title: json['title'] == null
        ? null
        : RenderedString.fromJson(json['title'] as Map<String, dynamic>),
    content: json['content'] == null
        ? null
        : RenderedString.fromJson(json['content'] as Map<String, dynamic>),
    acf: json['acf'] == null
        ? null
        : ACF.fromJson(json['acf'] as Map<String, dynamic>),
    imageUrl: json['imageUrl'] as String,
    thumbnailUrl: json['thumbnailUrl'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'acf': instance.acf,
      'imageUrl': instance.imageUrl,
      'thumbnailUrl': instance.thumbnailUrl,
    };

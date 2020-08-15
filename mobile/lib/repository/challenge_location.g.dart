// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeLocation _$ChallengeLocationFromJson(Map<String, dynamic> json) {
  return ChallengeLocation(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    imageUrl: json['imageUrl'] as String,
    thumbnailUrl: json['thumbnailUrl'] as String,
  );
}

Map<String, dynamic> _$ChallengeLocationToJson(ChallengeLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'imageUrl': instance.imageUrl,
      'thumbnailUrl': instance.thumbnailUrl,
    };

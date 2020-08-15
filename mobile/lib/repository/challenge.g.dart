// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) {
  return Challenge(
    id: json['id'] as String,
    title: json['title'] as String,
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
    locations: (json['locations'] as List)
        ?.map((e) => e == null
            ? null
            : ChallengeLocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'locations': instance.locations,
    };

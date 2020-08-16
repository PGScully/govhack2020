// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ACF _$ACFFromJson(Map<String, dynamic> json) {
  return ACF(
    address: json['address'] as String,
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
  );
}

Map<String, dynamic> _$ACFToJson(ACF instance) => <String, dynamic>{
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

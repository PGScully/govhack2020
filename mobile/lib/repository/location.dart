import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  int id;
  String title;
  String description;
  double latitude;
  double longitude;
  String imageUrl;
  String thumbnailUrl;

  Location({
    this.id,
    this.title,
    this.description,
    this.latitude,
    this.longitude,
    this.imageUrl = '',
    this.thumbnailUrl = '',
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

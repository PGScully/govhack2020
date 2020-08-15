import 'package:json_annotation/json_annotation.dart';

part 'challenge_location.g.dart';

@JsonSerializable()
class ChallengeLocation {
  int id;
  String title;
  String description;
  double latitude;
  double longitude;
  String imageUrl;
  String thumbnailUrl;

  ChallengeLocation({
    this.id,
    this.title,
    this.description,
    this.latitude,
    this.longitude,
    this.imageUrl = '',
    this.thumbnailUrl = '',
  });

  factory ChallengeLocation.fromJson(Map<String, dynamic> json) =>
      _$ChallengeLocationFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeLocationToJson(this);
}

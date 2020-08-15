import 'package:json_annotation/json_annotation.dart';

import 'package:twp/repository/challenge_location.dart';

part 'challenge.g.dart';

@JsonSerializable()
class Challenge {
  String id;
  String title;
  String latitude;
  String longitude;
  List<ChallengeLocation> locations;

  Challenge({
    this.id,
    this.title,
    this.latitude,
    this.longitude,
    this.locations,
  });

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeToJson(this);
}

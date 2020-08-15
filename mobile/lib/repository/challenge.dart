import 'package:json_annotation/json_annotation.dart';

import 'package:twp/repository/challenge_location.dart';

part 'challenge.g.dart';

@JsonSerializable()
class Challenge {
  int id;
  String title;
  String latitude;
  String longitude;
  List<int> locations;

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

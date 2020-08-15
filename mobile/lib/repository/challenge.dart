import 'package:geolocator/geolocator.dart';
import 'package:twp/repository/challenge_location.dart';

class Challenge {
  String title;
  Position position;
  List<ChallengeLocation> locations;
}

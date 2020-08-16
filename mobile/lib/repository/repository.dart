import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:twp/auth/status.dart';
import 'package:twp/auth/user_repository.dart';
import 'package:twp/repository/challenge.dart';
import 'package:twp/repository/location.dart';
import 'package:twp/repository/rest_client.dart';

/// Repository for all the offers
///
/// Without an authenticated user:
/// - return all offers near the location
///
/// With an authenticated user:
/// - return all the user's (active) offers
/// - return all the user's completed offers
/// - return the user's progress on an offer
class Repository with ChangeNotifier {
  UserRepository _userRepository;
  RestClient restClient;
  final List<Challenge> _challenges = [];
  final List<Location> _locations = [];

  Repository({@required UserRepository userRepository}) {
    final dio = Dio(); // Provide a dio instance
    restClient = RestClient(dio);

    _userRepository = userRepository;
    _loadDataInBackground();
    notifyListeners();
  }

  List<Challenge> get challenges => _challenges;
  List<Location> get locations => _locations;

  List<Location> challengesAt(Position position) {
    if (_userRepository.status == Status.authenticated) {
      return <Location>[];
    } else {
      return <Location>[];
    }
  }

  Future<void> _loadDataInBackground() async {
    // _challenges.clear();
    // restClient
    //     .getAllChallenges()
    //     .then((challenges) => _challenges.addAll(challenges));
    _locations.clear();
    restClient
        .getAllLocations()
        .then((locations) => _locations.addAll(locations));
    notifyListeners();
  }
}

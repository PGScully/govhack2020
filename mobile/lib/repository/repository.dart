import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:twp/auth/status.dart';

import 'package:twp/auth/user_repository.dart';
import 'package:twp/repository/challenge_location.dart';

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

  Repository({@required UserRepository userRepository}) {
    _userRepository = userRepository;
    _loadDataInBackground();
  }

  List<ChallengeLocation> challenges(Position position) {
    if (_userRepository.status == Status.authenticated) {
      return <ChallengeLocation>[];
    } else {
      return <ChallengeLocation>[];
    }
  }

  Future<void> _loadDataInBackground() async {}
}

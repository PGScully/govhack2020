import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:twp/auth/user_repository.dart';
import 'package:twp/repository/challenge.dart';

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
  }

  List<Challenge> challenges(Position position) {
    return <Challenge>[];
  }
}

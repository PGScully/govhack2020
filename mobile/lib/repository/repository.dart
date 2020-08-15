import 'package:flutter/material.dart';

/// Repository for all the offers
///
/// Without an authenticated user:
/// - return all offers near the location
///
/// With an authenticated user:
/// - return all the user's (active) offers
/// - return all the user's completed offers
/// - return the user's progress on an offer
class Repository extends ChangeNotifier {
  //
}

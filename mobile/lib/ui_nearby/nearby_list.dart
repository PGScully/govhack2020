import 'package:flutter/material.dart';

import 'package:twp/repository/challenge_location.dart';

class NearbyList extends StatelessWidget {
  final List<ChallengeLocation> _challenges = [];

  NearbyList({List<ChallengeLocation> challenges}) {
    _challenges.clear();
    if (challenges != null) {
      _challenges.addAll(challenges);
    }
  }

  @override
  Widget build(BuildContext context) => const Text('List of locations');
}

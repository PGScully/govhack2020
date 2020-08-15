import 'package:flutter/material.dart';

import 'package:twp/repository/challenge_location.dart';

class NearbyMap extends StatelessWidget {
  final List<ChallengeLocation> _challenges = [];

  NearbyMap({List<ChallengeLocation> challenges}) {
    _challenges.clear();
    if (challenges != null) {
      _challenges.addAll(challenges);
    }
  }

  @override
  Widget build(BuildContext context) => const Text('Map of locations');
}

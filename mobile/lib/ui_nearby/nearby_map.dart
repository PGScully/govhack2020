import 'package:flutter/material.dart';

import 'package:twp/repository/challenge.dart';

class NearbyMap extends StatelessWidget {
  final List<Challenge> _challenges = [];

  NearbyMap({List<Challenge> challenges}) {
    _challenges.clear();
    _challenges.addAll(challenges.reversed);
  }

  @override
  Widget build(BuildContext context) => const Text('Map of locations');
}

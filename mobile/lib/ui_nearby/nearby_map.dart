import 'package:flutter/material.dart';

import 'package:twp/repository/location.dart';

class NearbyMap extends StatelessWidget {
  final List<Location> _challenges = [];

  NearbyMap({List<Location> challenges}) {
    _challenges.clear();
    if (challenges != null) {
      _challenges.addAll(challenges);
    }
  }

  @override
  Widget build(BuildContext context) => const Text('Map of locations');
}

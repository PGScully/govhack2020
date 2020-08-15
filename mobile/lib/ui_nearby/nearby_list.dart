import 'package:flutter/material.dart';

import 'package:twp/repository/challenge.dart';

class NearbyList extends StatelessWidget {
  final List<Challenge> _challenges = [];

  NearbyList({List<Challenge> challenges}) {
    _challenges.clear();
    _challenges.addAll(challenges.reversed);
  }

  @override
  Widget build(BuildContext context) => const Text('List of locations');
}

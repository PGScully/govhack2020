import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:twp/repository/location.dart';
import 'package:twp/repository/location_tile.dart';
import 'package:twp/repository/repository.dart';

class NearbyList extends StatelessWidget {
  final List<Location> _locations = [];

  NearbyList({List<Location> locations}) {
    _locations.clear();
    if (locations != null) {
      _locations.addAll(locations);
    }
  }

  @override
  Widget build(BuildContext context) => Consumer<Repository>(
        builder: (context, repository, _) {
          _locations.clear();
          _locations.addAll(repository.locations);
          return ListView.builder(
            itemCount: _locations.length,
            itemBuilder: (context, index) =>
                LocationTile(location: _locations[index]),
          );
        },
      );
}

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:twp/repository/location.dart';
import 'package:twp/repository/repository.dart';

class NearbyMap extends StatelessWidget {
  final List<Location> _challenges = [];

  final LatLng _initialView = const LatLng(-27.989, 143.173);
  final double _initialZoom = 2.0;

  GoogleMapController mapController;

  NearbyMap({List<Location> challenges}) {
    _challenges.clear();
    if (challenges != null) {
      _challenges.addAll(challenges);
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) => Consumer<Repository>(
        builder: (context, repository, _) {
          return GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _initialView,
              zoom: _initialZoom,
            ),
            markers: _makeMarkers(repository.locations),
          );
        },
      );

  Set<Marker> _makeMarkers(List<Location> locations) {
    return locations
        .map(
          (l) => Marker(
            markerId: MarkerId(
              l.id.toString(),
            ),
            position: LatLng(
              double.parse(l.acf.latitude),
              double.parse(l.acf.longitude),
            ),
          ),
        )
        .toSet();
  }
}

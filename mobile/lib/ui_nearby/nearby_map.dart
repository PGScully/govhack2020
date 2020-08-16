import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:twp/repository/location.dart';
import 'package:twp/repository/repository.dart';
import 'package:twp/router.dart';

class NearbyMap extends StatelessWidget {
  final List<Location> _challenges = [];

  final LatLng _initialView = const LatLng(-26.787100, 134.469324);
  final double _initialZoom = 3.5;

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
            markers: _makeMarkers(repository.locations, context),
          );
        },
      );

  Set<Marker> _makeMarkers(List<Location> locations, BuildContext context) {
    return locations
        .map(
          (l) => Marker(
            markerId: MarkerId(
              l.id.toString(),
            ),
            infoWindow: InfoWindow(
                title: l.title.rendered,
                // snippet: l.content.rendered,
                onTap: () {
                  debugPrint('onTap: id=${l.id}');
                  Navigator.of(context)
                      .pushNamed(checkinRoute, arguments: l.id);
                }),
            position: LatLng(
              double.parse(l.acf.latitude),
              double.parse(l.acf.longitude),
            ),
          ),
        )
        .toSet();
  }
}

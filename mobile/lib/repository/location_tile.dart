import 'package:flutter/material.dart';

import 'package:twp/repository/location.dart';

class LocationTile extends StatelessWidget {
  Location location;

  LocationTile({
    Key key,
    @required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title: ${location.title}',
                textAlign: TextAlign.center,
              ),
              Text(
                'Description: ${location.description}',
                textAlign: TextAlign.start,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text('Lat: ${location.latitude}'),
                  ),
                  Expanded(
                    child: Text('Lon: ${location.longitude}'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

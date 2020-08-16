import 'package:flutter/material.dart';

import 'package:twp/repository/location.dart';

class LocationTile extends StatelessWidget {
  final Location location;

  const LocationTile({
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
                'Title: ${location.title?.rendered ?? "title"}',
                textAlign: TextAlign.center,
              ),
              Text(
                'Description: ${location.content?.rendered ?? "desc"}',
                textAlign: TextAlign.start,
              ),
              Text(
                'Address: ${location.acf?.address ?? "address"}',
                textAlign: TextAlign.start,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text('Lat: ${location.acf?.latitude}'),
                  ),
                  Expanded(
                    child: Text('Lon: ${location.acf?.longitude}'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

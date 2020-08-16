import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:twp/repository/location.dart';
import 'package:twp/router.dart';

class LocationTile extends StatelessWidget {
  final Location location;

  const LocationTile({
    Key key,
    @required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          debugPrint('onTap: id=${location.id}');
          Navigator.of(context).pushNamed(checkinRoute, arguments: location.id);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  location.title?.rendered ?? "",
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                Html(
                  data: location.content?.rendered ?? "",
                ),
                Text(
                  'Address: ${location.acf?.address ?? ""}',
                  textAlign: TextAlign.start,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Expanded(
                //       child: Text('Lat: ${location.acf?.latitude}'),
                //     ),
                //     Expanded(
                //       child: Text('Lon: ${location.acf?.longitude}'),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      );
}

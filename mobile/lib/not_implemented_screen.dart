import 'package:flutter/material.dart';

class NotImplementedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.red,
        child: Center(
          child: Text(
            'Not Yet Implemented',
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:baskin_robbins/models/store.dart';

class LocationCard extends StatelessWidget {
  final Store store;
  final double distance;

  LocationCard({@required this.store, @required this.distance});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              store.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(store.address),
            SizedBox(height: 8),
            Text('${distance.toStringAsFixed(2)} miles away'),
          ],
        ),
      ),
    );
  }
}
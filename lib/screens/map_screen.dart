import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Position _currentPosition;
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
      _addMarkers();
    });
  }

  void _addMarkers() async {
    // Replace the API key with your own
    final apiKey = 'YOUR_API_KEY';
    final addresses = await placemarkFromCoordinates(
        _currentPosition.latitude, _currentPosition.longitude,
        localeIdentifier: 'en_US');
    final address = addresses[0];
    final baskinRobbinsLocations = await placemarkFromQuery(
        'Baskin-Robbins 31', apiKey: apiKey,
        region: address.isoCountryCode);
    for (final baskinRobbinsLocation in baskinRobbinsLocations) {
      final lat = baskinRobbinsLocation.position.latitude;
      final lng = baskinRobbinsLocation.position.longitude;
      final marker = Marker(
        markerId: MarkerId(baskinRobbinsLocation.thoroughfare),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: baskinRobbinsLocation.thoroughfare),
      );
      setState(() {
        _markers.add(marker);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: _currentPosition != null
          ? GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
                zoom: 14.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set<Marker>.of(_markers),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
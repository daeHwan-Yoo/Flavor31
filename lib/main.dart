import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.422131, -122.084801);
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/location_pin.png")
        .then(
          (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: {
            Marker(
              markerId: const MarkerId("marker1"),
              position: const LatLng(37.422131, -122.084801),
              draggable: true,
              onDragEnd: (value) {
                // value is the new position
              },
              icon: markerIcon,
            ),
            Marker(
              markerId: const MarkerId("marker2"),
              position: const LatLng(37.415768808487435, -122.08440050482749),
            ),
          },

        ),
      ),
    );
  }
}
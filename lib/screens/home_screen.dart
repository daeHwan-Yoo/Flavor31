import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Geolocator _geolocator = Geolocator();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final PlacesService _places = PlacesService();
  Position _currentPosition;
  GoogleMapController _mapController;
  List<PlacesSearchResult> _placesResults = [];

  void _getCurrentLocation() async {
    Position position = await _geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onCameraMove(CameraPosition position) async {
    LatLng latLng = position.target;
    PlacesSearchResponse response = await _places.searchNearbyWithRadius(
        Location(lat: latLng.latitude, lng: latLng.longitude), 5000,
        type: 'cafe');
    setState(() {
      _placesResults = response.results;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baskin-Robbins 31'),
      ),
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
                zoom: 14,
              ),
              onCameraMove: _onCameraMove,
              markers: Set.from(_placesResults.map((result) => Marker(
                markerId: MarkerId(result.id),
                position: LatLng(result.geometry.location.lat, result.geometry.location.lng),
                infoWindow: InfoWindow(title: result.name),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
              ))),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_flavor');
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: 'Flavors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.pushNamed(context, '/flavors');
              break;
            case 2:
              if (_auth.currentUser != null) {
                // Navigate to account screen
              } else {
                Navigator.pushNamed(context, '/login');
              }
              break;
          }
        },
      ),
    );
  }
}
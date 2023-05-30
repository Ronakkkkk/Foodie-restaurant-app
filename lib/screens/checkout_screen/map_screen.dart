import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Location _location = Location();
  LatLng? _initialPosition;
  LatLng? _selectedPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationData? locationData;
    try {
      locationData = await _location.getLocation();
    } catch (e) {
      // Handle location service error
      locationData = null;
    }

    if (locationData != null) {
      setState(() {
        _initialPosition = LatLng(
          locationData!.latitude!,
          locationData.longitude!,
        );
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  void _onCameraIdle(double x, double y) async {
    _selectedPosition = await _mapController!
        .getLatLng(ScreenCoordinate(x: x.toInt(), y: y.toInt()));
    log(_selectedPosition.toString());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double screenHeight = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    double middleX = screenWidth / 2;
    double middleY = screenHeight / 2 - 54;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: _initialPosition != null
          ? Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition!,
                    zoom: 18.0,
                  ),
                  onMapCreated: _onMapCreated,
                  onCameraIdle: () => _onCameraIdle(middleX, middleY),
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                ),
                const Center(
                  child: Icon(
                    Icons.location_on,
                    size: 54,
                  ),
                )
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

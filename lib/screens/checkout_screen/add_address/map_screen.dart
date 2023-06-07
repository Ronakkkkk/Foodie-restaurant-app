import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

import '../../../constants/texts.dart';

class MapScreen extends StatefulWidget {
  final GoogleMapController? _mapController;
  final LatLng? _userLatLng;
  final void Function(GoogleMapController) _onMapCreated;
  final void Function(double, double) _setNewLocation;

  const MapScreen(this._mapController, this._userLatLng, this._onMapCreated, this._setNewLocation, {super.key});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 54;
    double screenWidth = MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio;
    double screenHeight = MediaQuery.of(context).size.height * MediaQuery.of(context).devicePixelRatio;
    double middleX = screenWidth / 2;
    double middleY = screenHeight / 2 - iconSize;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget._userLatLng!,
              zoom: 19.0,
            ),
            onMapCreated: widget._onMapCreated,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
          ),
          _CenterMarker(iconSize: iconSize),
          const Positioned(
            top: 40,
            left: 30,
            child: _BackButton(),
          ),
          Positioned(
            bottom: 25,
            height: 50,
            left: 50,
            right: 50,
            child: _SetLocationButton(widget: widget, middleX: middleX, middleY: middleY),
          ),
        ],
      ),
    );
  }
}

class _CenterMarker extends StatelessWidget {
  const _CenterMarker({
    required this.iconSize,
  });

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.location_on,
        size: iconSize,
      ),
    );
  }
}

class _SetLocationButton extends StatelessWidget {
  const _SetLocationButton({
    super.key,
    required this.widget,
    required this.middleX,
    required this.middleY,
  });

  final MapScreen widget;
  final double middleX;
  final double middleY;

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: kPrimaryColor,
      onTapUp: () {},
      onTapDown: () async {
        widget._setNewLocation(middleX, middleY);
        await Future.delayed(
          const Duration(milliseconds: 1000),
          () => Navigator.of(context).pop(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Text(
          "Set Location",
          textAlign: TextAlign.center,
          style: kCredText.copyWith(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Future.delayed(
          const Duration(milliseconds: 1000),
          () => Navigator.of(context).pop(),
        );
      },
      child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
          child: const Icon(
            FontAwesomeIcons.angleLeft,
            color: kBackground,
          )),
    );
  }
}

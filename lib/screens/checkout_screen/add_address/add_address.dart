import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/screens/checkout_screen/add_address/map_screen.dart';
import 'package:foodie/widgets/custom_app_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:geocoding/geocoding.dart' as Geo;

import '../../../firebase/addressinfo.dart';
import '../../../constants/texts.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  //firebase-init
  final FirebaseAuth _auth = FirebaseAuth.instance;
  addressFirestoreService firestoreService = addressFirestoreService();

  //form-controllers
  final userNameController = TextEditingController();
  final addressTitleController = TextEditingController();
  final userOrgController = TextEditingController();
  final addressDetailsController = TextEditingController();
  final userPhoneController = TextEditingController();
  final userAltPhoneController = TextEditingController();

  //maps-input
  GoogleMapController? _mapController;
  LatLng? _userLatLng;
  Location _location = Location();
  Geo.Placemark? _placemark;

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  Future<LatLng> _getCurrentLocation() async {
    if (_userLatLng == null) {
      LocationData locationData = await _location.getLocation();
      return LatLng(locationData.latitude!, locationData.longitude!);
    }
    return _userLatLng!;
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  void _setNewLocation(double x, double y) async {
    try {
      _userLatLng = await _mapController!
          .getLatLng(ScreenCoordinate(x: x.toInt(), y: y.toInt()));
      List<Geo.Placemark> placemarks = await Geo.placemarkFromCoordinates(
        _userLatLng!.latitude,
        _userLatLng!.longitude,
      );
      setState(() {
        _placemark = placemarks.first;
      });
      log(_placemark!.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addAddress(BuildContext context) async {
    try {
      // Get the current user ID
      User? currentUser = _auth.currentUser;
      String? userId = currentUser?.uid;

      if (userId != null) {
        // Get the address information from the text fields
        String userName = userNameController.text;
        String addressTitle = addressTitleController.text;
        String userOrganization = userOrgController.text;
        String addressDetails = addressDetailsController.text;
        String userPhone = userPhoneController.text;
        String userAltPhone = userAltPhoneController.text;

        String placemarkName = _placemark!.name!;
        String placemarkSubname = getPlacemarkSubname(_placemark!);

        // Add the user information to Firestore
        await firestoreService.addAddress(
            userId,
            userName,
            addressTitle,
            userOrganization,
            addressDetails,
            userPhone,
            userAltPhone,
            placemarkName,
            placemarkSubname,
            _userLatLng!.latitude,
            _userLatLng!.longitude);

        // Navigate to the home page
        Navigator.pop(context);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: kPrimaryColor),
                        child: const Icon(
                          FontAwesomeIcons.angleLeft,
                          color: kBackground,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Add New Address",
                        style:
                            kBigText.copyWith(fontSize: 24, color: kBackground),
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _mapPreviewWidget(),
              _mapBottomBar(context),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 25, left: 30),
                child: Text(
                  "Address Details",
                  style: kBigText.copyWith(fontSize: 20, color: Colors.white70),
                ),
              ),
              _addressDetailForm(context)
            ],
          ),
        ),
      ),
    );
  }

  Container _addressDetailForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(children: [
        _textField(addressTitleController, 'Address title (e.g. home, office)',
            1, TextInputType.text),
        _textField(userNameController, 'Name', 1, TextInputType.name),
        _textField(
            userOrgController, 'Organization name', 1, TextInputType.text),
        _textField(addressDetailsController, 'Detailed Address location', 4,
            TextInputType.text),
        _textField(userPhoneController, 'Phone Number', 1, TextInputType.phone),
        _textField(userAltPhoneController, 'Alternate phone number', 1,
            TextInputType.phone),
        const SizedBox(
          height: 20,
        ),
        NeoPopButton(
          color: Colors.white,
          onTapUp: () {},
          onTapDown: () async {
            await addAddress(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add address",
                  style: kCredText.copyWith(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _mapBottomBar(BuildContext context) {
    return Container(
      color: Colors.white10,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            _placemark == null
                ? ''
                : '${_placemark!.name!}, ${getPlacemarkSubname(_placemark!)}',
            style: kCredText.copyWith(color: Colors.white),
          ),
          Expanded(child: Container()),
          TextButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                "Set Location",
                style: kCredText.copyWith(color: kBackground),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MapScreen(
                    _mapController,
                    _userLatLng,
                    _onMapCreated,
                    _setNewLocation,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _mapPreviewWidget() {
    return Container(
      height: 240,
      width: double.infinity,
      child: FutureBuilder<LatLng>(
        future: _getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            ); // Show a loading indicator while waiting for data
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          _userLatLng = snapshot.data!;
          return Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  zoom: 18,
                  target: _userLatLng!,
                ),
              ),
              const Center(
                child: Icon(
                  Icons.location_on,
                  size: 48,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

String getPlacemarkSubname(Geo.Placemark placemark) {
  List<String> places = [
    placemark.locality!,
    placemark.subLocality!,
    placemark.thoroughfare!,
    placemark.subThoroughfare!
  ];

  String longest = '';

  for (String str in places) {
    if (str.length > longest.length) {
      longest = str;
    }
  }

  return longest;
}

Widget _textField(TextEditingController controller, String hinttext,
    int maxlines, TextInputType type) {
  return Column(
    children: [
      TextField(
        keyboardType: type,
        controller: controller,
        maxLines: maxlines,
        style: kTextField,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff6B6B6B), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff6B6B6B), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: hinttext,
          hintStyle: kHintText,
        ),
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:app_settings/app_settings.dart';
import 'package:rrr_shop_app/core/app_button.dart';

import '../../controller/get/product_controller/api_getx_controller.dart';
import '../../utils/constants.dart';

class GoogleMapLcationPage extends StatefulWidget {
  @override
  State<GoogleMapLcationPage> createState() => _GoogleMapLcationPageState();
}

class _GoogleMapLcationPageState extends State<GoogleMapLcationPage> {
  LatLng _center = const LatLng(15.508457, 32.522854);

  String _currentAddress = '';
  // Position? _currentPosition;
  var camera;
  bool isLoading = false;

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();

  final ValueNotifier<CameraPosition> currentCameraPosition = ValueNotifier(
      const CameraPosition(target: LatLng(15.508457, 32.522854), zoom: 18));

  _onMapCreated(GoogleMapController controller) {
    _controllerGoogleMap.complete(controller);
  }

  onCameraMove(CameraPosition position) {
    print("On Camera Move method $position");

    currentCameraPosition.value = position;
  }

  onCameraIdle() {
    print("On Camera Idle method");
  }

  final Set<Marker> markers = Set();

  @override
  void initState() {
    // _getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: background,
          toolbarHeight: 60.h,
          title: const Text(
            "select_location",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ).tr(),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 18.r,
              )),
        ),
        body: Stack(
          children: [
            GoogleMap(
              minMaxZoomPreference: const MinMaxZoomPreference(8, 19),
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              mapToolbarEnabled: false,
              rotateGesturesEnabled: false,
              tiltGesturesEnabled: false,
              myLocationEnabled: true,
              mapType: MapType.normal,
              compassEnabled: false,
              onMapCreated: _onMapCreated,
              onCameraMove: onCameraMove,
              onCameraIdle: onCameraIdle,
              gestureRecognizers: Set()
                ..add(Factory<PanGestureRecognizer>(
                    () => PanGestureRecognizer())),
              markers: markers,
              onTap: (argument) {
                _center = argument;
                markers.clear();
                markers.add(Marker(
                  markerId: MarkerId(argument.toString()),
                  position: argument,
                  infoWindow: const InfoWindow(
                    //popup info
                    title: 'My Custom Title ',
                    snippet: 'My Custom Subtitle',
                  ),
                  icon: BitmapDescriptor.defaultMarker,
                ));
                _getAddressFromLatLng();
                setState(() {});
              },
              initialCameraPosition: currentCameraPosition.value,
            ),
            Positioned(
              bottom: 10.h,
              left: 10.w,
              right: 10.w,
              child: BtnApp(
                  title: "select".tr(),
                  prsee: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getAddressFromLatLng() async {
    // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    await placemarkFromCoordinates(_center.latitude, _center.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality},${place.subAdministrativeArea}';
        // _currentAddress = '${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}';
        APIGetxController.to.address.value = _currentAddress;
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  // Future<bool> _handleLocationPermission() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text(
  //             'Location services are disabled. Please enable the services')));
  //     return false;
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text('Location permissions are denied')));
  //       return false;
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text(
  //             'Location permissions are permanently denied, we cannot request permissions.')));
  //     return false;
  //   }
  //   return true;
  // }

  // Future<void> _getCurrentPosition() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
  //     final hasPermission = await _handleLocationPermission();
  //     if (!hasPermission) return;
  //     await Geolocator.getCurrentPosition(
  //             desiredAccuracy: LocationAccuracy.high)
  //         .then((Position position) {
  //       setState(() {
  //         _currentPosition = position;
  //         _center =
  //             LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
  //         currentCameraPosition.value = CameraPosition(
  //           target: _center,
  //           zoom: 15.0,
  //         );
  //         markers.add(Marker(
  //           //add first marker
  //           markerId: MarkerId(_center.toString()),
  //           position: _center, //position of marker
  //           infoWindow: const InfoWindow(
  //             //popup info
  //             title: 'My Custom Title ',
  //             snippet: 'My Custom Subtitle',
  //           ),
  //           icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //         ));
  //         _getAddressFromLatLng();
  //         isLoading = false;
  //       });
  //     }).catchError((e) {
  //       debugPrint(e);
  //     });
  //   } else {
  //     _displayDialog(context);
  //   }
  // }

  // Future<void> _displayDialog(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content:
  //               const Text("يجب عليك الذهاب الي الاعدادات لتشغيل تحديد الموقع"),
  //           actions: <Widget>[
  //             TextButton(
  //                 child: const Text(
  //                   "حسنا",
  //                   style: TextStyle(color: Colors.red),
  //                 ),
  //                 onPressed: () async {
  //                   Navigator.pop(context);
  //                   await AppSettings.openLocationSettings(callback: () {
  //                     Navigator.pop(context);
  //                   });
  //                 }),
  //             TextButton(
  //               child: const Text(
  //                 "الغاء الامر",
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //               onPressed: () async {
  //                 Future.delayed(const Duration(milliseconds: 100), () {
  //                   Navigator.pop(context);
  //                   Navigator.pop(context);
  //                 });
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }
}

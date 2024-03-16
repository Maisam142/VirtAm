import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class CurrentLocationViewModel extends ChangeNotifier {
  static const LatLng sourceLocation = LatLng(31.996929, 35.883311);
  static const LatLng destinationLocation = LatLng(31.995674, 35.918739);
  LocationData currentLocation = LocationData.fromMap({
    'latitude': sourceLocation.latitude,
    'longitude': sourceLocation.longitude,
  });
  late MapController mapController;

  StreamSubscription<LocationData>? locationSubscription;

  void getCurrentLocation() async {
    Location location = Location();

    try {
      LocationData currentLoc = await location.getLocation();
      currentLocation = currentLoc;
      notifyListeners();
      locationSubscription = location.onLocationChanged.listen((newLoc) {
        mapController.move(
          LatLng(newLoc.latitude!, newLoc.longitude!),
          16.5,
        );

        currentLocation = newLoc;
        notifyListeners();
        //locationSubscription?.cancel();
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> currentLocationData() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    Location location = Location();

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    currentLocation = await location.getLocation();
  }
}

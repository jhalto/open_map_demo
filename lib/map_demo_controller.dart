
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapDemoController extends GetxController {
  RxList<Marker> markers = <Marker>[].obs; // Ensure it's observable

  void onMapTap(TapPosition tapPosition, LatLng latLng) {
    markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: latLng,
        child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
      ),
    );

    Get.snackbar(
      "Marker Added",
      "Lat: ${latLng.latitude}, Lng: ${latLng.longitude}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black54,
      colorText: Colors.white,
    );
  }
}

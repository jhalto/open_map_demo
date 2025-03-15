import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_map_demo/map_demo_controller.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});
  final controller = Get.put(MapDemoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tap to Add Marker")),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(23.8103, 90.4125), // Dhaka, Bangladesh
          initialZoom: 12.0,
          onTap: (tapPosition, latLng) => controller.onMapTap(tapPosition, latLng), // Add marker on tap
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          Obx(() => MarkerLayer(
                markers: List<Marker>.from(controller.markers), // Ensure it's a proper List<Marker>
              )),
        ],
      ),
    );
  }
}

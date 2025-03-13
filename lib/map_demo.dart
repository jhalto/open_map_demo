import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markers = [];

  void _onMapTap(TapPosition tapPosition, LatLng latLng) {
    setState(() {
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: latLng,
          child:  Icon(Icons.location_pin, color: Colors.red, size: 40),
        ),
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Marker added at: ${latLng.latitude}, ${latLng.longitude}"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tap to Add Marker")),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(23.8103, 90.4125), // Dhaka, Bangladesh
          initialZoom: 12.0,
          onTap: _onMapTap, // Add marker on tap
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayer(markers: markers),
        ],
      ),
    );
  }
}
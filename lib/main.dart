import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_map_demo/map_demo.dart';
import 'package:open_map_demo/map_demo_controller.dart';

void main() {
  Get.put(MapDemoController(), permanent: true); // ✅ Initialize once
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MapScreen(),
    );
  }
}

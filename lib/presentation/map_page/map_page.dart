import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng initialLocation = const LatLng(35.674516, 139.6977398);
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    //addCustomIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: initialLocation,
        zoom: 14,
      ),
      markers: {
        Marker(
          markerId: const MarkerId("marker1"),
          position: const LatLng(35.674516, 139.6977398),
          draggable: true,
          infoWindow: const InfoWindow(title: "明治神宮", snippet: '楽しかった'),
          onDragEnd: (value) {
            // value is the new position
          },
          icon: markerIcon,
        ),
        const Marker(
          markerId: MarkerId("marker2"),
          position: LatLng(35.6721279, 139.7010229),
          infoWindow: InfoWindow(title: "Meiji Cafe", snippet: 'おしゃれ'),
        ),
      },
    );
  }
}

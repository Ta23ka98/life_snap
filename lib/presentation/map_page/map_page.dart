import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/presentation/ar_screen_page/ar_screen_page.dart';

import 'map_page_notifier.dart';

class MapPage extends HookConsumerWidget {
  const MapPage({super.key});
  final BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mapPageNotifierProvider);
    final notifier = ref.watch(mapPageNotifierProvider.notifier);

    useEffect(() {
      Future.microtask(() async {
        notifier.getCurrentLocation();
      });
      return;
    }, const []);

    return Scaffold(
        body: state.isBusy
            ? const Center(child: CircularProgressIndicator())
            : GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: state.currentLocation,
                  zoom: 14.4746,
                ),
                markers: state.markers,
                onMapCreated: notifier.onMapCreated,
              ),
        floatingActionButton: Column(mainAxisSize: MainAxisSize.min, children: [
          FloatingActionButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ArScreenPage()));
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.camera_alt),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
              onPressed: () async {
                notifier.getCurrentLocation();
              },
              child: const Icon(Icons.location_searching))
        ]));
  }
}

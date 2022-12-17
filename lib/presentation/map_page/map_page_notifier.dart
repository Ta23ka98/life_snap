import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/entity/post/post.dart';
import '../../infrastructure/repository/image_repositrory.dart';
import '../../infrastructure/repository/map_repository.dart';
import '../../infrastructure/repository/post_repository.dart';
import '../../state/map_state/map_state.dart';

final mapPageNotifierProvider =
    StateNotifierProvider<MapPageNotifier, MapState>((ref) => MapPageNotifier(
          mapRepository: ref.read(mapRepositoryProvider),
          postRepository: ref.read(postRepositoryProvider),
          imageRepository: ref.read(imageRepositoryProvider),
        ));

class MapPageNotifier extends StateNotifier<MapState> {
  MapRepository mapRepository;
  PostRepository postRepository;
  ImageRepository imageRepository;
  MapPageNotifier(
      {required this.mapRepository,
      required this.postRepository,
      required this.imageRepository})
      : super(const MapState());

  final Completer<GoogleMapController> _mapController = Completer();

  void onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  Future<void> getCurrentLocation() async {
    state = state.copyWith(isBusy: true);
    try {
      final data = await mapRepository.getCurrentPosition();
      state = state.copyWith(
          isBusy: false,
          currentLocation: LatLng(data.latitude, data.longitude));
    } on Exception catch (e) {
      state = state.copyWith(isBusy: false, errorMessage: e.toString());
    }
    await _setMaker();
  }

  Future<void> _setMaker() async {
    final position = Position(
        // longitude: state.newLocation.longitude,
        // latitude: state.newLocation.latitude,
        longitude: state.currentLocation.longitude,
        latitude: state.currentLocation.latitude,
        timestamp: null,
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0);

    final stream = postRepository.getSearchPost(position: position, radius: 5);
    stream.listen((List<DocumentSnapshot> documentList) {
      var markers = documentList.map((docs) {
        final post = Post.fromDocument(docs);
        final latitude = post.postPosition!.geoPoint.latitude;
        final longitude = post.postPosition!.geoPoint.longitude;

        return Marker(
          markerId: MarkerId(post.id),
          position: LatLng(latitude, longitude),
          draggable: true,
          infoWindow: InfoWindow(title: post.title, snippet: post.content),
          icon: BitmapDescriptor.defaultMarker,
        );
      }).toSet();
      state = state.copyWith(markers: markers);
    });

    // Shift camera position
    CameraPosition updateCameraPosition =
        CameraPosition(target: state.currentLocation, zoom: 14.4746);
    final GoogleMapController controller = await _mapController.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(updateCameraPosition));
  }
}

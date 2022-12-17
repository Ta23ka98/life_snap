import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.freezed.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    @Default(false) bool isBusy,
    @Default(LatLng(34.729486, 135.614965)) LatLng currentLocation,
    @Default(LatLng(34.5110222, 135.6504958)) LatLng newLocation,
    @Default({}) Set<Marker> markers,
    String? errorMessage,
  }) = _MapState;
}

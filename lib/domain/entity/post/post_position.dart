// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:life_snap/common/json_converters.dart';

part 'post_position.freezed.dart';
part 'post_position.g.dart';

@freezed
class PostPosition with _$PostPosition {
  const factory PostPosition({
    @JsonKey(name: 'geohash') String? geoHash,
    @JsonKey(name: 'geopoint')
    @GeoFirePointConverter()
        required GeoPoint geoPoint,
  }) = _PostPosition;

  factory PostPosition.fromGeoFirePoint(GeoFirePoint geoFirePoint) =>
      PostPosition(geoHash: geoFirePoint.hash, geoPoint: geoFirePoint.geoPoint);

  factory PostPosition.fromJson(Map<String, dynamic> json) =>
      _$PostPositionFromJson(json);

  factory PostPosition.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = Map<String, dynamic>.from(ds.data()! as Map);
    return PostPosition.fromJson(data);
  }

  factory PostPosition.fromCollectionSnapshot(CollectionReference cr) {
    final data = cr.doc() as Map<String, dynamic>;
    return PostPosition.fromJson(data);
  }
}

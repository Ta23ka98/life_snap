import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_snap/domain/entity/post/post_position.dart';

// DocumentReferenceの変換
class DocumentReferenceConverter
    implements JsonConverter<DocumentReference, DocumentReference> {
  const DocumentReferenceConverter();

  @override
  DocumentReference fromJson(DocumentReference reference) => reference;

  @override
  DocumentReference toJson(DocumentReference reference) => reference;
}

// GeoPointの変換
class GeoFirePointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoFirePointConverter();

  @override
  GeoPoint fromJson(GeoPoint geopoint) => geopoint;

  @override
  GeoPoint toJson(GeoPoint geopoint) => geopoint;
}

class GeoPositionConverter
    implements JsonConverter<PostPosition, Map<String, Object?>> {
  const GeoPositionConverter();

  @override
  PostPosition fromJson(Map<String, Object?> position) =>
      PostPosition.fromJson(position);

  @override
  Map<String, Object?> toJson(PostPosition position) =>
      {'geopoint': position.geoPoint, 'geohash': position.geoHash};
}

// Timestampの変換
class TimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}

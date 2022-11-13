import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
class GeoPointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(GeoPoint geopoint) => geopoint;

  @override
  GeoPoint toJson(GeoPoint geopoint) => geopoint;
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

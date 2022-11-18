// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostPosition _$$_PostPositionFromJson(Map<String, dynamic> json) =>
    _$_PostPosition(
      geoHash: json['geohash'] as String?,
      geoPoint:
          const GeoFirePointConverter().fromJson(json['geopoint'] as GeoPoint),
    );

Map<String, dynamic> _$$_PostPositionToJson(_$_PostPosition instance) =>
    <String, dynamic>{
      'geohash': instance.geoHash,
      'geopoint': const GeoFirePointConverter().toJson(instance.geoPoint),
    };

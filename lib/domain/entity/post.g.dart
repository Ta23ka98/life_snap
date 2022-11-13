// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      postReference: _$JsonConverterFromJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          json['postReference'], const DocumentReferenceConverter().fromJson),
      postUserId: json['postUserId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      postImageURL: json['postImageURL'] as String,
      likeCount: json['likeCount'] as int? ?? 0,
      point: const GeoPointConverter().fromJson(json['point'] as GeoPoint),
      geoHash: json['geoHash'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'postReference': _$JsonConverterToJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          instance.postReference, const DocumentReferenceConverter().toJson),
      'postUserId': instance.postUserId,
      'title': instance.title,
      'content': instance.content,
      'postImageURL': instance.postImageURL,
      'likeCount': instance.likeCount,
      'point': const GeoPointConverter().toJson(instance.point),
      'geoHash': instance.geoHash,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

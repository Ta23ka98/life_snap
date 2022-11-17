// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as String,
      postUserRef: _$JsonConverterFromJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          json['postUserRef'], const DocumentReferenceConverter().fromJson),
      postRef: _$JsonConverterFromJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          json['postRef'], const DocumentReferenceConverter().fromJson),
      title: json['title'] as String,
      content: json['content'] as String,
      postImageURL: json['postImageURL'] as String?,
      likeCount: json['likeCount'] as int? ?? 0,
      postPosition: _$JsonConverterFromJson<Map<String, Object?>, PostPosition>(
          json['postPosition'], const GeoPositionConverter().fromJson),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'postUserRef': _$JsonConverterToJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          instance.postUserRef, const DocumentReferenceConverter().toJson),
      'postRef': _$JsonConverterToJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          instance.postRef, const DocumentReferenceConverter().toJson),
      'title': instance.title,
      'content': instance.content,
      'postImageURL': instance.postImageURL,
      'likeCount': instance.likeCount,
      'postPosition': _$JsonConverterToJson<Map<String, Object?>, PostPosition>(
          instance.postPosition, const GeoPositionConverter().toJson),
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyLike _$$_MyLikeFromJson(Map<String, dynamic> json) => _$_MyLike(
      id: json['id'] as String?,
      postRef: _$JsonConverterFromJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          json['postRef'], const DocumentReferenceConverter().fromJson),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_MyLikeToJson(_$_MyLike instance) => <String, dynamic>{
      'id': instance.id,
      'postRef': _$JsonConverterToJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          instance.postRef, const DocumentReferenceConverter().toJson),
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

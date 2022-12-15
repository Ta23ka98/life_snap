// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LikedUser _$$_LikedUserFromJson(Map<String, dynamic> json) => _$_LikedUser(
      id: json['id'] as String?,
      postUserRef: _$JsonConverterFromJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          json['postUserRef'], const DocumentReferenceConverter().fromJson),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_LikedUserToJson(_$_LikedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postUserRef': _$JsonConverterToJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          instance.postUserRef, const DocumentReferenceConverter().toJson),
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

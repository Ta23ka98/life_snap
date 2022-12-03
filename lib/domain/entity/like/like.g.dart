// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Like _$$_LikeFromJson(Map<String, dynamic> json) => _$_Like(
      id: json['id'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_LikeToJson(_$_Like instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

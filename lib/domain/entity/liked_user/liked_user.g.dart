// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LikedUser _$$_LikedUserFromJson(Map<String, dynamic> json) => _$_LikedUser(
      id: json['id'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_LikedUserToJson(_$_LikedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

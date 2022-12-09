// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyPost _$$_MyPostFromJson(Map<String, dynamic> json) => _$_MyPost(
      id: json['id'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_MyPostToJson(_$_MyPost instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

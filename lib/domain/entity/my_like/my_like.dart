import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_snap/common/json_converters.dart';

part 'my_like.freezed.dart';
part 'my_like.g.dart';

@freezed
class MyLike with _$MyLike {
  factory MyLike({
    String? id, // いいねをした投稿ID
    @DocumentReferenceConverter() DocumentReference? postRef, 
    @TimestampConverter() DateTime? createdAt, // 投稿時間
  }) = _MyLike;

  factory MyLike.fromJson(Map<String, dynamic> json) => _$MyLikeFromJson(json);

  factory MyLike.fromDocument(DocumentSnapshot docs) {
    final data = Map<String, dynamic>.from(docs.data()! as Map);
    return MyLike.fromJson(data);
  }
}

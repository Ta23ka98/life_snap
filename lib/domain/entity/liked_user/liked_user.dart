import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_snap/common/json_converters.dart';

part 'liked_user.freezed.dart';
part 'liked_user.g.dart';

@freezed
class LikedUser with _$LikedUser {
  factory LikedUser({
    String? id, // いいねを押したUserのId
     @DocumentReferenceConverter()
        DocumentReference? postUserRef,
    @TimestampConverter() DateTime? createdAt, // 投稿時間
  }) = _LikedUser;

  factory LikedUser.fromJson(Map<String, dynamic> json) => _$LikedUserFromJson(json);

  factory LikedUser.fromDocument(DocumentSnapshot docs) {
    final data = Map<String, dynamic>.from(docs.data()! as Map);
    return LikedUser.fromJson(data);
  }
}

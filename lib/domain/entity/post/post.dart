import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_snap/common/json_converters.dart';
import 'package:life_snap/domain/entity/post/post_position.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    required String id,
    @DocumentReferenceConverter()
        DocumentReference? postUserRef, // userのReference
    @DocumentReferenceConverter() DocumentReference? postRef, // postのReference
    required String title, // タイトル
    required String content, // 投稿内容
    String? postImageURL, // 投稿写真のURL
    @Default(0) int? likeCount, // いいね数
    @GeoPositionConverter() PostPosition? postPosition, // 位置座標
    @TimestampConverter() DateTime? createdAt, // 投稿時間
  }) = _Post;

  // Postの初期化
  factory Post.initial() => Post(
        id: "",
        title: "",
        content: "",
      );

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromDocument(DocumentSnapshot docs) {
    final data = Map<String, dynamic>.from(docs.data()! as Map);
    return Post.fromJson(data);
  }
}

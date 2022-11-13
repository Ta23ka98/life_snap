import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/json_converters.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    @DocumentReferenceConverter()
        DocumentReference?
            postReference, // Postのリファレンス postReference.idでuid取得可能
    required String postUserId, // 投稿者のuid
    required String title, // タイトル
    required String content, // 投稿内容
    required String postImageURL, // 投稿写真のURL
    @Default(0) int? likeCount, // いいね数
    @GeoPointConverter() required GeoPoint point, // 位置座標（緯度、経度）
    required String geoHash,
    @TimestampConverter() DateTime? createdAt, // 投稿時間
  }) = _Post;

  // Postの初期化
  factory Post.initial() => Post(
      postUserId: "",
      title: "",
      content: "",
      postImageURL: "",
      geoHash: "",
      point: const GeoPoint(0, 0));

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromDocument(DocumentSnapshot docs) {
    final data = Map<String, dynamic>.from(docs.data()! as Map);
    return Post.fromJson(data);
  }
}

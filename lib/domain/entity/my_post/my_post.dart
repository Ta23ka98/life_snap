import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_snap/common/json_converters.dart';

part 'my_post.freezed.dart';
part 'my_post.g.dart';

@freezed
class MyPost with _$MyPost {
  factory MyPost({
    String? id, // 投稿ID
    @TimestampConverter() DateTime? createdAt, // 投稿時間
  }) = _MyPost;

  factory MyPost.fromJson(Map<String, dynamic> json) => _$MyPostFromJson(json);

  factory MyPost.fromDocument(DocumentSnapshot docs) {
    final data = Map<String, dynamic>.from(docs.data()! as Map);
    return MyPost.fromJson(data);
  }
}

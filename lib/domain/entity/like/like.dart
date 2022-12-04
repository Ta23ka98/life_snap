import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_snap/common/json_converters.dart';

part 'like.freezed.dart';
part 'like.g.dart';

@freezed
class Like with _$Like {
  factory Like({
    String? id, // likeした投稿ID
    @TimestampConverter() DateTime? createdAt, // 投稿時間
  }) = _Like;

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);

  factory Like.fromDocument(DocumentSnapshot docs) {
    final data = Map<String, dynamic>.from(docs.data()! as Map);
    return Like.fromJson(data);
  }
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postUserRef =>
      throw _privateConstructorUsedError; // userのReference
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postRef =>
      throw _privateConstructorUsedError; // postのReference
  String get title => throw _privateConstructorUsedError; // タイトル
  String get content => throw _privateConstructorUsedError; // 投稿内容
  String? get postImageURL => throw _privateConstructorUsedError; // 投稿写真のURL
  int? get likeCount => throw _privateConstructorUsedError; // いいね数
  @GeoPositionConverter()
  PostPosition? get postPosition => throw _privateConstructorUsedError; // 位置座標
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String id,
      @DocumentReferenceConverter() DocumentReference<Object?>? postUserRef,
      @DocumentReferenceConverter() DocumentReference<Object?>? postRef,
      String title,
      String content,
      String? postImageURL,
      int? likeCount,
      @GeoPositionConverter() PostPosition? postPosition,
      @TimestampConverter() DateTime? createdAt});

  $PostPositionCopyWith<$Res>? get postPosition;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postUserRef = freezed,
    Object? postRef = freezed,
    Object? title = null,
    Object? content = null,
    Object? postImageURL = freezed,
    Object? likeCount = freezed,
    Object? postPosition = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postUserRef: freezed == postUserRef
          ? _value.postUserRef
          : postUserRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      postImageURL: freezed == postImageURL
          ? _value.postImageURL
          : postImageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      postPosition: freezed == postPosition
          ? _value.postPosition
          : postPosition // ignore: cast_nullable_to_non_nullable
              as PostPosition?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostPositionCopyWith<$Res>? get postPosition {
    if (_value.postPosition == null) {
      return null;
    }

    return $PostPositionCopyWith<$Res>(_value.postPosition!, (value) {
      return _then(_value.copyWith(postPosition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @DocumentReferenceConverter() DocumentReference<Object?>? postUserRef,
      @DocumentReferenceConverter() DocumentReference<Object?>? postRef,
      String title,
      String content,
      String? postImageURL,
      int? likeCount,
      @GeoPositionConverter() PostPosition? postPosition,
      @TimestampConverter() DateTime? createdAt});

  @override
  $PostPositionCopyWith<$Res>? get postPosition;
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res, _$_Post>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postUserRef = freezed,
    Object? postRef = freezed,
    Object? title = null,
    Object? content = null,
    Object? postImageURL = freezed,
    Object? likeCount = freezed,
    Object? postPosition = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Post(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postUserRef: freezed == postUserRef
          ? _value.postUserRef
          : postUserRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      postImageURL: freezed == postImageURL
          ? _value.postImageURL
          : postImageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      postPosition: freezed == postPosition
          ? _value.postPosition
          : postPosition // ignore: cast_nullable_to_non_nullable
              as PostPosition?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post implements _Post {
  _$_Post(
      {required this.id,
      @DocumentReferenceConverter() this.postUserRef,
      @DocumentReferenceConverter() this.postRef,
      required this.title,
      required this.content,
      this.postImageURL,
      this.likeCount = 0,
      @GeoPositionConverter() this.postPosition,
      @TimestampConverter() this.createdAt});

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  final String id;
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? postUserRef;
// userのReference
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? postRef;
// postのReference
  @override
  final String title;
// タイトル
  @override
  final String content;
// 投稿内容
  @override
  final String? postImageURL;
// 投稿写真のURL
  @override
  @JsonKey()
  final int? likeCount;
// いいね数
  @override
  @GeoPositionConverter()
  final PostPosition? postPosition;
// 位置座標
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Post(id: $id, postUserRef: $postUserRef, postRef: $postRef, title: $title, content: $content, postImageURL: $postImageURL, likeCount: $likeCount, postPosition: $postPosition, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postUserRef, postUserRef) ||
                other.postUserRef == postUserRef) &&
            (identical(other.postRef, postRef) || other.postRef == postRef) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.postImageURL, postImageURL) ||
                other.postImageURL == postImageURL) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.postPosition, postPosition) ||
                other.postPosition == postPosition) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, postUserRef, postRef, title,
      content, postImageURL, likeCount, postPosition, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  factory _Post(
      {required final String id,
      @DocumentReferenceConverter()
          final DocumentReference<Object?>? postUserRef,
      @DocumentReferenceConverter()
          final DocumentReference<Object?>? postRef,
      required final String title,
      required final String content,
      final String? postImageURL,
      final int? likeCount,
      @GeoPositionConverter()
          final PostPosition? postPosition,
      @TimestampConverter()
          final DateTime? createdAt}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get id;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postUserRef;
  @override // userのReference
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postRef;
  @override // postのReference
  String get title;
  @override // タイトル
  String get content;
  @override // 投稿内容
  String? get postImageURL;
  @override // 投稿写真のURL
  int? get likeCount;
  @override // いいね数
  @GeoPositionConverter()
  PostPosition? get postPosition;
  @override // 位置座標
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}

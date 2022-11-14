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
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postReference =>
      throw _privateConstructorUsedError;
  String get postUserId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get postImageURL => throw _privateConstructorUsedError;
  int? get likeCount => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint get point => throw _privateConstructorUsedError;
  String get geoHash => throw _privateConstructorUsedError;
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
      {@DocumentReferenceConverter() DocumentReference<Object?>? postReference,
      String postUserId,
      String title,
      String content,
      String postImageURL,
      int? likeCount,
      @GeoPointConverter() GeoPoint point,
      String geoHash,
      @TimestampConverter() DateTime? createdAt});
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
    Object? postReference = freezed,
    Object? postUserId = null,
    Object? title = null,
    Object? content = null,
    Object? postImageURL = null,
    Object? likeCount = freezed,
    Object? point = null,
    Object? geoHash = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      postReference: freezed == postReference
          ? _value.postReference
          : postReference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      postUserId: null == postUserId
          ? _value.postUserId
          : postUserId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      postImageURL: null == postImageURL
          ? _value.postImageURL
          : postImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      geoHash: null == geoHash
          ? _value.geoHash
          : geoHash // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DocumentReferenceConverter() DocumentReference<Object?>? postReference,
      String postUserId,
      String title,
      String content,
      String postImageURL,
      int? likeCount,
      @GeoPointConverter() GeoPoint point,
      String geoHash,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res, _$_Post>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postReference = freezed,
    Object? postUserId = null,
    Object? title = null,
    Object? content = null,
    Object? postImageURL = null,
    Object? likeCount = freezed,
    Object? point = null,
    Object? geoHash = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Post(
      postReference: freezed == postReference
          ? _value.postReference
          : postReference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      postUserId: null == postUserId
          ? _value.postUserId
          : postUserId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      postImageURL: null == postImageURL
          ? _value.postImageURL
          : postImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      geoHash: null == geoHash
          ? _value.geoHash
          : geoHash // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@DocumentReferenceConverter() this.postReference,
      required this.postUserId,
      required this.title,
      required this.content,
      required this.postImageURL,
      this.likeCount = 0,
      @GeoPointConverter() required this.point,
      required this.geoHash,
      @TimestampConverter() this.createdAt});

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? postReference;
  @override
  final String postUserId;
  @override
  final String title;
  @override
  final String content;
  @override
  final String postImageURL;
  @override
  @JsonKey()
  final int? likeCount;
  @override
  @GeoPointConverter()
  final GeoPoint point;
  @override
  final String geoHash;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Post(postReference: $postReference, postUserId: $postUserId, title: $title, content: $content, postImageURL: $postImageURL, likeCount: $likeCount, point: $point, geoHash: $geoHash, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            (identical(other.postReference, postReference) ||
                other.postReference == postReference) &&
            (identical(other.postUserId, postUserId) ||
                other.postUserId == postUserId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.postImageURL, postImageURL) ||
                other.postImageURL == postImageURL) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.geoHash, geoHash) || other.geoHash == geoHash) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, postReference, postUserId, title,
      content, postImageURL, likeCount, point, geoHash, createdAt);

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
      {@DocumentReferenceConverter()
          final DocumentReference<Object?>? postReference,
      required final String postUserId,
      required final String title,
      required final String content,
      required final String postImageURL,
      final int? likeCount,
      @GeoPointConverter()
          required final GeoPoint point,
      required final String geoHash,
      @TimestampConverter()
          final DateTime? createdAt}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postReference;
  @override
  String get postUserId;
  @override
  String get title;
  @override
  String get content;
  @override
  String get postImageURL;
  @override
  int? get likeCount;
  @override
  @GeoPointConverter()
  GeoPoint get point;
  @override
  String get geoHash;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}

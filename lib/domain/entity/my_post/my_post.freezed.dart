// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyPost _$MyPostFromJson(Map<String, dynamic> json) {
  return _MyPost.fromJson(json);
}

/// @nodoc
mixin _$MyPost {
  String? get id => throw _privateConstructorUsedError; // 投稿ID
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyPostCopyWith<MyPost> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPostCopyWith<$Res> {
  factory $MyPostCopyWith(MyPost value, $Res Function(MyPost) then) =
      _$MyPostCopyWithImpl<$Res, MyPost>;
  @useResult
  $Res call({String? id, @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$MyPostCopyWithImpl<$Res, $Val extends MyPost>
    implements $MyPostCopyWith<$Res> {
  _$MyPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyPostCopyWith<$Res> implements $MyPostCopyWith<$Res> {
  factory _$$_MyPostCopyWith(_$_MyPost value, $Res Function(_$_MyPost) then) =
      __$$_MyPostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_MyPostCopyWithImpl<$Res>
    extends _$MyPostCopyWithImpl<$Res, _$_MyPost>
    implements _$$_MyPostCopyWith<$Res> {
  __$$_MyPostCopyWithImpl(_$_MyPost _value, $Res Function(_$_MyPost) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_MyPost(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyPost implements _MyPost {
  _$_MyPost({this.id, @TimestampConverter() this.createdAt});

  factory _$_MyPost.fromJson(Map<String, dynamic> json) =>
      _$$_MyPostFromJson(json);

  @override
  final String? id;
// 投稿ID
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'MyPost(id: $id, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyPost &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyPostCopyWith<_$_MyPost> get copyWith =>
      __$$_MyPostCopyWithImpl<_$_MyPost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyPostToJson(
      this,
    );
  }
}

abstract class _MyPost implements MyPost {
  factory _MyPost(
      {final String? id,
      @TimestampConverter() final DateTime? createdAt}) = _$_MyPost;

  factory _MyPost.fromJson(Map<String, dynamic> json) = _$_MyPost.fromJson;

  @override
  String? get id;
  @override // 投稿ID
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MyPostCopyWith<_$_MyPost> get copyWith =>
      throw _privateConstructorUsedError;
}

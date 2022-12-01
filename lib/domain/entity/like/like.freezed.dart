// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Like _$LikeFromJson(Map<String, dynamic> json) {
  return _Like.fromJson(json);
}

/// @nodoc
mixin _$Like {
  String? get id => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postUserRef =>
      throw _privateConstructorUsedError; // userのReference
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postRef =>
      throw _privateConstructorUsedError; // postのReference
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikeCopyWith<Like> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeCopyWith<$Res> {
  factory $LikeCopyWith(Like value, $Res Function(Like) then) =
      _$LikeCopyWithImpl<$Res, Like>;
  @useResult
  $Res call(
      {String? id,
      @DocumentReferenceConverter() DocumentReference<Object?>? postUserRef,
      @DocumentReferenceConverter() DocumentReference<Object?>? postRef,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$LikeCopyWithImpl<$Res, $Val extends Like>
    implements $LikeCopyWith<$Res> {
  _$LikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? postUserRef = freezed,
    Object? postRef = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      postUserRef: freezed == postUserRef
          ? _value.postUserRef
          : postUserRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikeCopyWith<$Res> implements $LikeCopyWith<$Res> {
  factory _$$_LikeCopyWith(_$_Like value, $Res Function(_$_Like) then) =
      __$$_LikeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @DocumentReferenceConverter() DocumentReference<Object?>? postUserRef,
      @DocumentReferenceConverter() DocumentReference<Object?>? postRef,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_LikeCopyWithImpl<$Res> extends _$LikeCopyWithImpl<$Res, _$_Like>
    implements _$$_LikeCopyWith<$Res> {
  __$$_LikeCopyWithImpl(_$_Like _value, $Res Function(_$_Like) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? postUserRef = freezed,
    Object? postRef = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Like(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      postUserRef: freezed == postUserRef
          ? _value.postUserRef
          : postUserRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Like implements _Like {
  _$_Like(
      {this.id,
      @DocumentReferenceConverter() this.postUserRef,
      @DocumentReferenceConverter() this.postRef,
      @TimestampConverter() this.createdAt});

  factory _$_Like.fromJson(Map<String, dynamic> json) => _$$_LikeFromJson(json);

  @override
  final String? id;
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? postUserRef;
// userのReference
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? postRef;
// postのReference
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Like(id: $id, postUserRef: $postUserRef, postRef: $postRef, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Like &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postUserRef, postUserRef) ||
                other.postUserRef == postUserRef) &&
            (identical(other.postRef, postRef) || other.postRef == postRef) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, postUserRef, postRef, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikeCopyWith<_$_Like> get copyWith =>
      __$$_LikeCopyWithImpl<_$_Like>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikeToJson(
      this,
    );
  }
}

abstract class _Like implements Like {
  factory _Like(
      {final String? id,
      @DocumentReferenceConverter()
          final DocumentReference<Object?>? postUserRef,
      @DocumentReferenceConverter()
          final DocumentReference<Object?>? postRef,
      @TimestampConverter()
          final DateTime? createdAt}) = _$_Like;

  factory _Like.fromJson(Map<String, dynamic> json) = _$_Like.fromJson;

  @override
  String? get id;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postUserRef;
  @override // userのReference
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postRef;
  @override // postのReference
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_LikeCopyWith<_$_Like> get copyWith => throw _privateConstructorUsedError;
}

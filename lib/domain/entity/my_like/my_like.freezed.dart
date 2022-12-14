// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyLike _$MyLikeFromJson(Map<String, dynamic> json) {
  return _MyLike.fromJson(json);
}

/// @nodoc
mixin _$MyLike {
  String? get id => throw _privateConstructorUsedError; // いいねをした投稿ID
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postRef => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyLikeCopyWith<MyLike> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyLikeCopyWith<$Res> {
  factory $MyLikeCopyWith(MyLike value, $Res Function(MyLike) then) =
      _$MyLikeCopyWithImpl<$Res, MyLike>;
  @useResult
  $Res call(
      {String? id,
      @DocumentReferenceConverter() DocumentReference<Object?>? postRef,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$MyLikeCopyWithImpl<$Res, $Val extends MyLike>
    implements $MyLikeCopyWith<$Res> {
  _$MyLikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? postRef = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_MyLikeCopyWith<$Res> implements $MyLikeCopyWith<$Res> {
  factory _$$_MyLikeCopyWith(_$_MyLike value, $Res Function(_$_MyLike) then) =
      __$$_MyLikeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @DocumentReferenceConverter() DocumentReference<Object?>? postRef,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_MyLikeCopyWithImpl<$Res>
    extends _$MyLikeCopyWithImpl<$Res, _$_MyLike>
    implements _$$_MyLikeCopyWith<$Res> {
  __$$_MyLikeCopyWithImpl(_$_MyLike _value, $Res Function(_$_MyLike) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? postRef = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_MyLike(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_MyLike implements _MyLike {
  _$_MyLike(
      {this.id,
      @DocumentReferenceConverter() this.postRef,
      @TimestampConverter() this.createdAt});

  factory _$_MyLike.fromJson(Map<String, dynamic> json) =>
      _$$_MyLikeFromJson(json);

  @override
  final String? id;
// いいねをした投稿ID
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? postRef;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'MyLike(id: $id, postRef: $postRef, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyLike &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postRef, postRef) || other.postRef == postRef) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, postRef, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyLikeCopyWith<_$_MyLike> get copyWith =>
      __$$_MyLikeCopyWithImpl<_$_MyLike>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyLikeToJson(
      this,
    );
  }
}

abstract class _MyLike implements MyLike {
  factory _MyLike(
      {final String? id,
      @DocumentReferenceConverter() final DocumentReference<Object?>? postRef,
      @TimestampConverter() final DateTime? createdAt}) = _$_MyLike;

  factory _MyLike.fromJson(Map<String, dynamic> json) = _$_MyLike.fromJson;

  @override
  String? get id;
  @override // いいねをした投稿ID
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postRef;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MyLikeCopyWith<_$_MyLike> get copyWith =>
      throw _privateConstructorUsedError;
}

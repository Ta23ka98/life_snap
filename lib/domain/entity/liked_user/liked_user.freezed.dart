// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'liked_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LikedUser _$LikedUserFromJson(Map<String, dynamic> json) {
  return _LikedUser.fromJson(json);
}

/// @nodoc
mixin _$LikedUser {
  String? get id => throw _privateConstructorUsedError; // いいねを押したUserのId
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postUserRef =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikedUserCopyWith<LikedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedUserCopyWith<$Res> {
  factory $LikedUserCopyWith(LikedUser value, $Res Function(LikedUser) then) =
      _$LikedUserCopyWithImpl<$Res, LikedUser>;
  @useResult
  $Res call(
      {String? id,
      @DocumentReferenceConverter() DocumentReference<Object?>? postUserRef,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$LikedUserCopyWithImpl<$Res, $Val extends LikedUser>
    implements $LikedUserCopyWith<$Res> {
  _$LikedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? postUserRef = freezed,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikedUserCopyWith<$Res> implements $LikedUserCopyWith<$Res> {
  factory _$$_LikedUserCopyWith(
          _$_LikedUser value, $Res Function(_$_LikedUser) then) =
      __$$_LikedUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @DocumentReferenceConverter() DocumentReference<Object?>? postUserRef,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_LikedUserCopyWithImpl<$Res>
    extends _$LikedUserCopyWithImpl<$Res, _$_LikedUser>
    implements _$$_LikedUserCopyWith<$Res> {
  __$$_LikedUserCopyWithImpl(
      _$_LikedUser _value, $Res Function(_$_LikedUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? postUserRef = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_LikedUser(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      postUserRef: freezed == postUserRef
          ? _value.postUserRef
          : postUserRef // ignore: cast_nullable_to_non_nullable
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
class _$_LikedUser implements _LikedUser {
  _$_LikedUser(
      {this.id,
      @DocumentReferenceConverter() this.postUserRef,
      @TimestampConverter() this.createdAt});

  factory _$_LikedUser.fromJson(Map<String, dynamic> json) =>
      _$$_LikedUserFromJson(json);

  @override
  final String? id;
// いいねを押したUserのId
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? postUserRef;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'LikedUser(id: $id, postUserRef: $postUserRef, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikedUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postUserRef, postUserRef) ||
                other.postUserRef == postUserRef) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, postUserRef, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikedUserCopyWith<_$_LikedUser> get copyWith =>
      __$$_LikedUserCopyWithImpl<_$_LikedUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikedUserToJson(
      this,
    );
  }
}

abstract class _LikedUser implements LikedUser {
  factory _LikedUser(
      {final String? id,
      @DocumentReferenceConverter()
          final DocumentReference<Object?>? postUserRef,
      @TimestampConverter()
          final DateTime? createdAt}) = _$_LikedUser;

  factory _LikedUser.fromJson(Map<String, dynamic> json) =
      _$_LikedUser.fromJson;

  @override
  String? get id;
  @override // いいねを押したUserのId
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get postUserRef;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_LikedUserCopyWith<_$_LikedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

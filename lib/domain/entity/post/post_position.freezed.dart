// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostPosition _$PostPositionFromJson(Map<String, dynamic> json) {
  return _PostPosition.fromJson(json);
}

/// @nodoc
mixin _$PostPosition {
  @JsonKey(name: 'geohash')
  String? get geoHash => throw _privateConstructorUsedError;
  @JsonKey(name: 'geopoint')
  @GeoFirePointConverter()
  GeoPoint get geoPoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostPositionCopyWith<PostPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostPositionCopyWith<$Res> {
  factory $PostPositionCopyWith(
          PostPosition value, $Res Function(PostPosition) then) =
      _$PostPositionCopyWithImpl<$Res, PostPosition>;
  @useResult
  $Res call(
      {@JsonKey(name: 'geohash') String? geoHash,
      @JsonKey(name: 'geopoint') @GeoFirePointConverter() GeoPoint geoPoint});
}

/// @nodoc
class _$PostPositionCopyWithImpl<$Res, $Val extends PostPosition>
    implements $PostPositionCopyWith<$Res> {
  _$PostPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoHash = freezed,
    Object? geoPoint = null,
  }) {
    return _then(_value.copyWith(
      geoHash: freezed == geoHash
          ? _value.geoHash
          : geoHash // ignore: cast_nullable_to_non_nullable
              as String?,
      geoPoint: null == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostPositionCopyWith<$Res>
    implements $PostPositionCopyWith<$Res> {
  factory _$$_PostPositionCopyWith(
          _$_PostPosition value, $Res Function(_$_PostPosition) then) =
      __$$_PostPositionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'geohash') String? geoHash,
      @JsonKey(name: 'geopoint') @GeoFirePointConverter() GeoPoint geoPoint});
}

/// @nodoc
class __$$_PostPositionCopyWithImpl<$Res>
    extends _$PostPositionCopyWithImpl<$Res, _$_PostPosition>
    implements _$$_PostPositionCopyWith<$Res> {
  __$$_PostPositionCopyWithImpl(
      _$_PostPosition _value, $Res Function(_$_PostPosition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoHash = freezed,
    Object? geoPoint = null,
  }) {
    return _then(_$_PostPosition(
      geoHash: freezed == geoHash
          ? _value.geoHash
          : geoHash // ignore: cast_nullable_to_non_nullable
              as String?,
      geoPoint: null == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostPosition implements _PostPosition {
  const _$_PostPosition(
      {@JsonKey(name: 'geohash')
          this.geoHash,
      @JsonKey(name: 'geopoint')
      @GeoFirePointConverter()
          required this.geoPoint});

  factory _$_PostPosition.fromJson(Map<String, dynamic> json) =>
      _$$_PostPositionFromJson(json);

  @override
  @JsonKey(name: 'geohash')
  final String? geoHash;
  @override
  @JsonKey(name: 'geopoint')
  @GeoFirePointConverter()
  final GeoPoint geoPoint;

  @override
  String toString() {
    return 'PostPosition(geoHash: $geoHash, geoPoint: $geoPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostPosition &&
            (identical(other.geoHash, geoHash) || other.geoHash == geoHash) &&
            (identical(other.geoPoint, geoPoint) ||
                other.geoPoint == geoPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, geoHash, geoPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostPositionCopyWith<_$_PostPosition> get copyWith =>
      __$$_PostPositionCopyWithImpl<_$_PostPosition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostPositionToJson(
      this,
    );
  }
}

abstract class _PostPosition implements PostPosition {
  const factory _PostPosition(
      {@JsonKey(name: 'geohash')
          final String? geoHash,
      @JsonKey(name: 'geopoint')
      @GeoFirePointConverter()
          required final GeoPoint geoPoint}) = _$_PostPosition;

  factory _PostPosition.fromJson(Map<String, dynamic> json) =
      _$_PostPosition.fromJson;

  @override
  @JsonKey(name: 'geohash')
  String? get geoHash;
  @override
  @JsonKey(name: 'geopoint')
  @GeoFirePointConverter()
  GeoPoint get geoPoint;
  @override
  @JsonKey(ignore: true)
  _$$_PostPositionCopyWith<_$_PostPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

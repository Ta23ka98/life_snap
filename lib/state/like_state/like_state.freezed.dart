// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'like_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LikeState {
  bool? get isFavolit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikeStateCopyWith<LikeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeStateCopyWith<$Res> {
  factory $LikeStateCopyWith(LikeState value, $Res Function(LikeState) then) =
      _$LikeStateCopyWithImpl<$Res, LikeState>;
  @useResult
  $Res call({bool? isFavolit});
}

/// @nodoc
class _$LikeStateCopyWithImpl<$Res, $Val extends LikeState>
    implements $LikeStateCopyWith<$Res> {
  _$LikeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavolit = freezed,
  }) {
    return _then(_value.copyWith(
      isFavolit: freezed == isFavolit
          ? _value.isFavolit
          : isFavolit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikeStateCopyWith<$Res> implements $LikeStateCopyWith<$Res> {
  factory _$$_LikeStateCopyWith(
          _$_LikeState value, $Res Function(_$_LikeState) then) =
      __$$_LikeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isFavolit});
}

/// @nodoc
class __$$_LikeStateCopyWithImpl<$Res>
    extends _$LikeStateCopyWithImpl<$Res, _$_LikeState>
    implements _$$_LikeStateCopyWith<$Res> {
  __$$_LikeStateCopyWithImpl(
      _$_LikeState _value, $Res Function(_$_LikeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavolit = freezed,
  }) {
    return _then(_$_LikeState(
      isFavolit: freezed == isFavolit
          ? _value.isFavolit
          : isFavolit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_LikeState implements _LikeState {
  const _$_LikeState({this.isFavolit});

  @override
  final bool? isFavolit;

  @override
  String toString() {
    return 'LikeState(isFavolit: $isFavolit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikeState &&
            (identical(other.isFavolit, isFavolit) ||
                other.isFavolit == isFavolit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFavolit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikeStateCopyWith<_$_LikeState> get copyWith =>
      __$$_LikeStateCopyWithImpl<_$_LikeState>(this, _$identity);
}

abstract class _LikeState implements LikeState {
  const factory _LikeState({final bool? isFavolit}) = _$_LikeState;

  @override
  bool? get isFavolit;
  @override
  @JsonKey(ignore: true)
  _$$_LikeStateCopyWith<_$_LikeState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'liked_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LikedUserState {
  bool? get isFavolit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikedUserStateCopyWith<LikedUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedUserStateCopyWith<$Res> {
  factory $LikedUserStateCopyWith(
          LikedUserState value, $Res Function(LikedUserState) then) =
      _$LikedUserStateCopyWithImpl<$Res, LikedUserState>;
  @useResult
  $Res call({bool? isFavolit});
}

/// @nodoc
class _$LikedUserStateCopyWithImpl<$Res, $Val extends LikedUserState>
    implements $LikedUserStateCopyWith<$Res> {
  _$LikedUserStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_LikedUserStateCopyWith<$Res>
    implements $LikedUserStateCopyWith<$Res> {
  factory _$$_LikedUserStateCopyWith(
          _$_LikedUserState value, $Res Function(_$_LikedUserState) then) =
      __$$_LikedUserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isFavolit});
}

/// @nodoc
class __$$_LikedUserStateCopyWithImpl<$Res>
    extends _$LikedUserStateCopyWithImpl<$Res, _$_LikedUserState>
    implements _$$_LikedUserStateCopyWith<$Res> {
  __$$_LikedUserStateCopyWithImpl(
      _$_LikedUserState _value, $Res Function(_$_LikedUserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavolit = freezed,
  }) {
    return _then(_$_LikedUserState(
      isFavolit: freezed == isFavolit
          ? _value.isFavolit
          : isFavolit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_LikedUserState implements _LikedUserState {
  const _$_LikedUserState({this.isFavolit});

  @override
  final bool? isFavolit;

  @override
  String toString() {
    return 'LikedUserState(isFavolit: $isFavolit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikedUserState &&
            (identical(other.isFavolit, isFavolit) ||
                other.isFavolit == isFavolit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFavolit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikedUserStateCopyWith<_$_LikedUserState> get copyWith =>
      __$$_LikedUserStateCopyWithImpl<_$_LikedUserState>(this, _$identity);
}

abstract class _LikedUserState implements LikedUserState {
  const factory _LikedUserState({final bool? isFavolit}) = _$_LikedUserState;

  @override
  bool? get isFavolit;
  @override
  @JsonKey(ignore: true)
  _$$_LikedUserStateCopyWith<_$_LikedUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

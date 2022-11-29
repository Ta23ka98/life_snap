// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'annotations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnnotationsState {
  List<Annotation> get annotations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnotationsStateCopyWith<AnnotationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnotationsStateCopyWith<$Res> {
  factory $AnnotationsStateCopyWith(
          AnnotationsState value, $Res Function(AnnotationsState) then) =
      _$AnnotationsStateCopyWithImpl<$Res, AnnotationsState>;
  @useResult
  $Res call({List<Annotation> annotations});
}

/// @nodoc
class _$AnnotationsStateCopyWithImpl<$Res, $Val extends AnnotationsState>
    implements $AnnotationsStateCopyWith<$Res> {
  _$AnnotationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annotations = null,
  }) {
    return _then(_value.copyWith(
      annotations: null == annotations
          ? _value.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<Annotation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnotationsStateCopyWith<$Res>
    implements $AnnotationsStateCopyWith<$Res> {
  factory _$$_AnnotationsStateCopyWith(
          _$_AnnotationsState value, $Res Function(_$_AnnotationsState) then) =
      __$$_AnnotationsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Annotation> annotations});
}

/// @nodoc
class __$$_AnnotationsStateCopyWithImpl<$Res>
    extends _$AnnotationsStateCopyWithImpl<$Res, _$_AnnotationsState>
    implements _$$_AnnotationsStateCopyWith<$Res> {
  __$$_AnnotationsStateCopyWithImpl(
      _$_AnnotationsState _value, $Res Function(_$_AnnotationsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annotations = null,
  }) {
    return _then(_$_AnnotationsState(
      annotations: null == annotations
          ? _value._annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<Annotation>,
    ));
  }
}

/// @nodoc

class _$_AnnotationsState implements _AnnotationsState {
  const _$_AnnotationsState({final List<Annotation> annotations = const []})
      : _annotations = annotations;

  final List<Annotation> _annotations;
  @override
  @JsonKey()
  List<Annotation> get annotations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_annotations);
  }

  @override
  String toString() {
    return 'AnnotationsState(annotations: $annotations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnotationsState &&
            const DeepCollectionEquality()
                .equals(other._annotations, _annotations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_annotations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnotationsStateCopyWith<_$_AnnotationsState> get copyWith =>
      __$$_AnnotationsStateCopyWithImpl<_$_AnnotationsState>(this, _$identity);
}

abstract class _AnnotationsState implements AnnotationsState {
  const factory _AnnotationsState({final List<Annotation> annotations}) =
      _$_AnnotationsState;

  @override
  List<Annotation> get annotations;
  @override
  @JsonKey(ignore: true)
  _$$_AnnotationsStateCopyWith<_$_AnnotationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrentLocationState {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentLocationStateCopyWith<CurrentLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentLocationStateCopyWith<$Res> {
  factory $CurrentLocationStateCopyWith(CurrentLocationState value,
          $Res Function(CurrentLocationState) then) =
      _$CurrentLocationStateCopyWithImpl<$Res, CurrentLocationState>;
  @useResult
  $Res call({double lat, double lng, String address});
}

/// @nodoc
class _$CurrentLocationStateCopyWithImpl<$Res,
        $Val extends CurrentLocationState>
    implements $CurrentLocationStateCopyWith<$Res> {
  _$CurrentLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentLocationStateImplCopyWith<$Res>
    implements $CurrentLocationStateCopyWith<$Res> {
  factory _$$CurrentLocationStateImplCopyWith(_$CurrentLocationStateImpl value,
          $Res Function(_$CurrentLocationStateImpl) then) =
      __$$CurrentLocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng, String address});
}

/// @nodoc
class __$$CurrentLocationStateImplCopyWithImpl<$Res>
    extends _$CurrentLocationStateCopyWithImpl<$Res, _$CurrentLocationStateImpl>
    implements _$$CurrentLocationStateImplCopyWith<$Res> {
  __$$CurrentLocationStateImplCopyWithImpl(_$CurrentLocationStateImpl _value,
      $Res Function(_$CurrentLocationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? address = null,
  }) {
    return _then(_$CurrentLocationStateImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CurrentLocationStateImpl implements _CurrentLocationState {
  _$CurrentLocationStateImpl(
      {required this.lat, required this.lng, required this.address});

  @override
  final double lat;
  @override
  final double lng;
  @override
  final String address;

  @override
  String toString() {
    return 'CurrentLocationState(lat: $lat, lng: $lng, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentLocationStateImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lng, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentLocationStateImplCopyWith<_$CurrentLocationStateImpl>
      get copyWith =>
          __$$CurrentLocationStateImplCopyWithImpl<_$CurrentLocationStateImpl>(
              this, _$identity);
}

abstract class _CurrentLocationState implements CurrentLocationState {
  factory _CurrentLocationState(
      {required final double lat,
      required final double lng,
      required final String address}) = _$CurrentLocationStateImpl;

  @override
  double get lat;
  @override
  double get lng;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$CurrentLocationStateImplCopyWith<_$CurrentLocationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shrine_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShrineState {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<Photo>? get photos => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;
  String? get distance => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  num? get rating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShrineStateCopyWith<ShrineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShrineStateCopyWith<$Res> {
  factory $ShrineStateCopyWith(
          ShrineState value, $Res Function(ShrineState) then) =
      _$ShrineStateCopyWithImpl<$Res, ShrineState>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      List<Photo>? photos,
      double? lat,
      double? lng,
      String? distance,
      String? duration,
      num? rating});
}

/// @nodoc
class _$ShrineStateCopyWithImpl<$Res, $Val extends ShrineState>
    implements $ShrineStateCopyWith<$Res> {
  _$ShrineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photos = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShrineStateImplCopyWith<$Res>
    implements $ShrineStateCopyWith<$Res> {
  factory _$$ShrineStateImplCopyWith(
          _$ShrineStateImpl value, $Res Function(_$ShrineStateImpl) then) =
      __$$ShrineStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      List<Photo>? photos,
      double? lat,
      double? lng,
      String? distance,
      String? duration,
      num? rating});
}

/// @nodoc
class __$$ShrineStateImplCopyWithImpl<$Res>
    extends _$ShrineStateCopyWithImpl<$Res, _$ShrineStateImpl>
    implements _$$ShrineStateImplCopyWith<$Res> {
  __$$ShrineStateImplCopyWithImpl(
      _$ShrineStateImpl _value, $Res Function(_$ShrineStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photos = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$ShrineStateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc

class _$ShrineStateImpl implements _ShrineState {
  _$ShrineStateImpl(
      {this.id,
      this.name,
      final List<Photo>? photos,
      this.lat,
      this.lng,
      this.distance,
      this.duration,
      this.rating})
      : _photos = photos;

  @override
  final String? id;
  @override
  final String? name;
  final List<Photo>? _photos;
  @override
  List<Photo>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? lat;
  @override
  final double? lng;
  @override
  final String? distance;
  @override
  final String? duration;
  @override
  final num? rating;

  @override
  String toString() {
    return 'ShrineState(id: $id, name: $name, photos: $photos, lat: $lat, lng: $lng, distance: $distance, duration: $duration, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShrineStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_photos),
      lat,
      lng,
      distance,
      duration,
      rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShrineStateImplCopyWith<_$ShrineStateImpl> get copyWith =>
      __$$ShrineStateImplCopyWithImpl<_$ShrineStateImpl>(this, _$identity);
}

abstract class _ShrineState implements ShrineState {
  factory _ShrineState(
      {final String? id,
      final String? name,
      final List<Photo>? photos,
      final double? lat,
      final double? lng,
      final String? distance,
      final String? duration,
      final num? rating}) = _$ShrineStateImpl;

  @override
  String? get id;
  @override
  String? get name;
  @override
  List<Photo>? get photos;
  @override
  double? get lat;
  @override
  double? get lng;
  @override
  String? get distance;
  @override
  String? get duration;
  @override
  num? get rating;
  @override
  @JsonKey(ignore: true)
  _$$ShrineStateImplCopyWith<_$ShrineStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

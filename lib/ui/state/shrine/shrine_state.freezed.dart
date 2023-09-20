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
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Photo>? get photos => throw _privateConstructorUsedError;
  List<Review>? get reviews => throw _privateConstructorUsedError;
  String? get mapUrl => throw _privateConstructorUsedError;
  int? get distance => throw _privateConstructorUsedError;

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
      {String id,
      String name,
      List<Photo>? photos,
      List<Review>? reviews,
      String? mapUrl,
      int? distance});
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
    Object? id = null,
    Object? name = null,
    Object? photos = freezed,
    Object? reviews = freezed,
    Object? mapUrl = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      mapUrl: freezed == mapUrl
          ? _value.mapUrl
          : mapUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShrineStateCopyWith<$Res>
    implements $ShrineStateCopyWith<$Res> {
  factory _$$_ShrineStateCopyWith(
          _$_ShrineState value, $Res Function(_$_ShrineState) then) =
      __$$_ShrineStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<Photo>? photos,
      List<Review>? reviews,
      String? mapUrl,
      int? distance});
}

/// @nodoc
class __$$_ShrineStateCopyWithImpl<$Res>
    extends _$ShrineStateCopyWithImpl<$Res, _$_ShrineState>
    implements _$$_ShrineStateCopyWith<$Res> {
  __$$_ShrineStateCopyWithImpl(
      _$_ShrineState _value, $Res Function(_$_ShrineState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photos = freezed,
    Object? reviews = freezed,
    Object? mapUrl = freezed,
    Object? distance = freezed,
  }) {
    return _then(_$_ShrineState(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      mapUrl: freezed == mapUrl
          ? _value.mapUrl
          : mapUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ShrineState implements _ShrineState {
  _$_ShrineState(
      {required this.id,
      required this.name,
      final List<Photo>? photos,
      final List<Review>? reviews,
      this.mapUrl,
      this.distance})
      : _photos = photos,
        _reviews = reviews;

  @override
  final String id;
  @override
  final String name;
  final List<Photo>? _photos;
  @override
  List<Photo>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Review>? _reviews;
  @override
  List<Review>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? mapUrl;
  @override
  final int? distance;

  @override
  String toString() {
    return 'ShrineState(id: $id, name: $name, photos: $photos, reviews: $reviews, mapUrl: $mapUrl, distance: $distance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShrineState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.mapUrl, mapUrl) || other.mapUrl == mapUrl) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_photos),
      const DeepCollectionEquality().hash(_reviews),
      mapUrl,
      distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShrineStateCopyWith<_$_ShrineState> get copyWith =>
      __$$_ShrineStateCopyWithImpl<_$_ShrineState>(this, _$identity);
}

abstract class _ShrineState implements ShrineState {
  factory _ShrineState(
      {required final String id,
      required final String name,
      final List<Photo>? photos,
      final List<Review>? reviews,
      final String? mapUrl,
      final int? distance}) = _$_ShrineState;

  @override
  String get id;
  @override
  String get name;
  @override
  List<Photo>? get photos;
  @override
  List<Review>? get reviews;
  @override
  String? get mapUrl;
  @override
  int? get distance;
  @override
  @JsonKey(ignore: true)
  _$$_ShrineStateCopyWith<_$_ShrineState> get copyWith =>
      throw _privateConstructorUsedError;
}

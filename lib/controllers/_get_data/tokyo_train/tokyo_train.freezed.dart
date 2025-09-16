// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokyo_train.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TokyoTrainState {
  List<TokyoTrainModel> get tokyoTrainList =>
      throw _privateConstructorUsedError;
  Map<String, List<TokyoStationModel>> get tokyoStationMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of TokyoTrainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokyoTrainStateCopyWith<TokyoTrainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokyoTrainStateCopyWith<$Res> {
  factory $TokyoTrainStateCopyWith(
          TokyoTrainState value, $Res Function(TokyoTrainState) then) =
      _$TokyoTrainStateCopyWithImpl<$Res, TokyoTrainState>;
  @useResult
  $Res call(
      {List<TokyoTrainModel> tokyoTrainList,
      Map<String, List<TokyoStationModel>> tokyoStationMap});
}

/// @nodoc
class _$TokyoTrainStateCopyWithImpl<$Res, $Val extends TokyoTrainState>
    implements $TokyoTrainStateCopyWith<$Res> {
  _$TokyoTrainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokyoTrainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokyoTrainList = null,
    Object? tokyoStationMap = null,
  }) {
    return _then(_value.copyWith(
      tokyoTrainList: null == tokyoTrainList
          ? _value.tokyoTrainList
          : tokyoTrainList // ignore: cast_nullable_to_non_nullable
              as List<TokyoTrainModel>,
      tokyoStationMap: null == tokyoStationMap
          ? _value.tokyoStationMap
          : tokyoStationMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TokyoStationModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokyoTrainStateImplCopyWith<$Res>
    implements $TokyoTrainStateCopyWith<$Res> {
  factory _$$TokyoTrainStateImplCopyWith(_$TokyoTrainStateImpl value,
          $Res Function(_$TokyoTrainStateImpl) then) =
      __$$TokyoTrainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TokyoTrainModel> tokyoTrainList,
      Map<String, List<TokyoStationModel>> tokyoStationMap});
}

/// @nodoc
class __$$TokyoTrainStateImplCopyWithImpl<$Res>
    extends _$TokyoTrainStateCopyWithImpl<$Res, _$TokyoTrainStateImpl>
    implements _$$TokyoTrainStateImplCopyWith<$Res> {
  __$$TokyoTrainStateImplCopyWithImpl(
      _$TokyoTrainStateImpl _value, $Res Function(_$TokyoTrainStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokyoTrainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokyoTrainList = null,
    Object? tokyoStationMap = null,
  }) {
    return _then(_$TokyoTrainStateImpl(
      tokyoTrainList: null == tokyoTrainList
          ? _value._tokyoTrainList
          : tokyoTrainList // ignore: cast_nullable_to_non_nullable
              as List<TokyoTrainModel>,
      tokyoStationMap: null == tokyoStationMap
          ? _value._tokyoStationMap
          : tokyoStationMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TokyoStationModel>>,
    ));
  }
}

/// @nodoc

class _$TokyoTrainStateImpl implements _TokyoTrainState {
  const _$TokyoTrainStateImpl(
      {final List<TokyoTrainModel> tokyoTrainList = const <TokyoTrainModel>[],
      final Map<String, List<TokyoStationModel>> tokyoStationMap =
          const <String, List<TokyoStationModel>>{}})
      : _tokyoTrainList = tokyoTrainList,
        _tokyoStationMap = tokyoStationMap;

  final List<TokyoTrainModel> _tokyoTrainList;
  @override
  @JsonKey()
  List<TokyoTrainModel> get tokyoTrainList {
    if (_tokyoTrainList is EqualUnmodifiableListView) return _tokyoTrainList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokyoTrainList);
  }

  final Map<String, List<TokyoStationModel>> _tokyoStationMap;
  @override
  @JsonKey()
  Map<String, List<TokyoStationModel>> get tokyoStationMap {
    if (_tokyoStationMap is EqualUnmodifiableMapView) return _tokyoStationMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tokyoStationMap);
  }

  @override
  String toString() {
    return 'TokyoTrainState(tokyoTrainList: $tokyoTrainList, tokyoStationMap: $tokyoStationMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokyoTrainStateImpl &&
            const DeepCollectionEquality()
                .equals(other._tokyoTrainList, _tokyoTrainList) &&
            const DeepCollectionEquality()
                .equals(other._tokyoStationMap, _tokyoStationMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tokyoTrainList),
      const DeepCollectionEquality().hash(_tokyoStationMap));

  /// Create a copy of TokyoTrainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokyoTrainStateImplCopyWith<_$TokyoTrainStateImpl> get copyWith =>
      __$$TokyoTrainStateImplCopyWithImpl<_$TokyoTrainStateImpl>(
          this, _$identity);
}

abstract class _TokyoTrainState implements TokyoTrainState {
  const factory _TokyoTrainState(
          {final List<TokyoTrainModel> tokyoTrainList,
          final Map<String, List<TokyoStationModel>> tokyoStationMap}) =
      _$TokyoTrainStateImpl;

  @override
  List<TokyoTrainModel> get tokyoTrainList;
  @override
  Map<String, List<TokyoStationModel>> get tokyoStationMap;

  /// Create a copy of TokyoTrainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokyoTrainStateImplCopyWith<_$TokyoTrainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
